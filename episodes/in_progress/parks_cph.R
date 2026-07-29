# ============================================================
# Hent og beskær OSM-parker for København og Frederiksberg
# ============================================================

library(osmdata)
library(sf)
library(dplyr)
library(ggplot2)


# ------------------------------------------------------------
# 1. Filstier
# ------------------------------------------------------------

boundary_file <- "episodes/data/bydele_and_frederiksberg.gpkg"

output_file <- paste0(
  "episodes/data/",
  "parks_koebenhavn_frederiksberg.gpkg"
)

output_layer <- "parks"


if (!file.exists(boundary_file)) {
  stop(
    "Filen findes ikke: ",
    boundary_file
  )
}


# ------------------------------------------------------------
# 2. Vælg Overpass-server
# ------------------------------------------------------------

set_overpass_url(
  "https://overpass-api.de/api/interpreter"
)

message(
  "Overpass-server: ",
  get_overpass_url()
)


# ------------------------------------------------------------
# 3. Find OSM-områderne
# ------------------------------------------------------------

area_ids <- c(
  Copenhagen = getbb(
    "Københavns Kommune, Danmark",
    format_out = "osm_type_id"
  ),
  Frederiksberg = getbb(
    "Frederiksberg Kommune, Danmark",
    format_out = "osm_type_id"
  )
)

print(area_ids)


# Kontrollér, at Nominatim har fundet relationer eller lukkede ways

valid_area_id <- grepl(
  pattern = "^(relation|way)\\(id:[0-9]+\\)$",
  x = area_ids
)

if (!all(valid_area_id)) {
  stop(
    paste0(
      "Et eller flere områder kunne ikke fortolkes:\n",
      paste(area_ids, collapse = "\n")
    )
  )
}


# ------------------------------------------------------------
# 4. Kombinér områderne korrekt
# ------------------------------------------------------------

area_table <- data.frame(
  osm_type = sub(
    pattern = "\\(.*$",
    replacement = "",
    x = area_ids
  ),
  osm_id = sub(
    pattern = "^.*id:([0-9]+).*$",
    replacement = "\\1",
    x = area_ids
  )
)

search_area <- bbox_to_string(area_table)

message(
  "Samlet OSM-søgeområde: ",
  search_area
)


# ------------------------------------------------------------
# 5. Byg Overpass-forespørgslen
# ------------------------------------------------------------

parks_query <- opq(
  bbox = search_area,
  osm_types = c("way", "relation"),
  timeout = 120
) |>
  add_osm_feature(
    key = "leisure",
    value = "park"
  )


# Vis den færdige Overpass-forespørgsel

cat(
  "\nOverpass-forespørgsel:\n\n",
  opq_string(parks_query),
  "\n\n"
)


# ------------------------------------------------------------
# 6. Hent OSM-data
# ------------------------------------------------------------

parks_osm <- osmdata_sf(
  parks_query,
  quiet = FALSE
)


# ------------------------------------------------------------
# 7. Funktion til klargøring af polygonlag
# ------------------------------------------------------------

prepare_polygon_layer <- function(x, osm_element) {

  if (is.null(x) || nrow(x) == 0L) {
    return(NULL)
  }

  x <- st_make_valid(x)

  # Behold polygondele, hvis st_make_valid() har dannet
  # GEOMETRYCOLLECTION-geometrier
  x <- st_collection_extract(
    x,
    type = "POLYGON",
    warn = FALSE
  )

  if (nrow(x) == 0L) {
    return(NULL)
  }

  # Ensartet geometritype gør lagene lettere at kombinere
  x <- st_cast(
    x,
    "MULTIPOLYGON",
    warn = FALSE
  )

  x$osm_element <- osm_element

  x
}


# ------------------------------------------------------------
# 8. Klargør ways og relationer
# ------------------------------------------------------------

park_polygons <- prepare_polygon_layer(
  parks_osm$osm_polygons,
  osm_element = "way"
)

park_multipolygons <- prepare_polygon_layer(
  parks_osm$osm_multipolygons,
  osm_element = "relation"
)


polygon_layers <- Filter(
  f = Negate(is.null),
  x = list(
    park_polygons,
    park_multipolygons
  )
)

if (length(polygon_layers) == 0L) {
  stop(
    "Overpass-forespørgslen returnerede ingen parkpolygoner."
  )
}


# Saml almindelige polygoner og multipolygon-relationer

parks <- bind_rows(polygon_layers) |>
  st_as_sf()

message(
  "Antal parkobjekter hentet fra OSM: ",
  nrow(parks)
)


# ------------------------------------------------------------
# 9. Læs kommune- og bydelsgrænserne
# ------------------------------------------------------------

bydele <- st_read(
  boundary_file,
  quiet = TRUE
)

if (is.na(st_crs(bydele))) {
  stop(
    "Grænselaget har ikke et defineret koordinatsystem."
  )
}

bydele <- st_make_valid(bydele)


# ------------------------------------------------------------
# 10. Transformér parker til samme CRS
# ------------------------------------------------------------

parks <- parks |>
  st_transform(
    st_crs(bydele)
  ) |>
  st_make_valid()


# ------------------------------------------------------------
# 11. Dan ét samlet område
# ------------------------------------------------------------

# st_union() opløser de indre bydelsgrænser.
# Resultatet er København og Frederiksberg som ét klippeområde.

study_area <- st_sf(
  geometry = st_union(
    st_geometry(bydele)
  )
) |>
  st_make_valid()


# ------------------------------------------------------------
# 12. Beskær parkerne
# ------------------------------------------------------------

parks_clipped <- st_intersection(
  parks,
  study_area
)

# Behold kun polygongeometri. Parker, der blot rører grænsen
# i et punkt eller langs en linje, fjernes dermed.

parks_clipped <- parks_clipped |>
  st_make_valid() |>
  st_collection_extract(
    type = "POLYGON",
    warn = FALSE
  )

parks_clipped <- parks_clipped[
  !st_is_empty(parks_clipped),
  ,
  drop = FALSE
]

parks_clipped <- st_cast(
  parks_clipped,
  "MULTIPOLYGON",
  warn = FALSE
)

if (nrow(parks_clipped) == 0L) {
  stop(
    "Der var ingen parkpolygoner tilbage efter beskæringen."
  )
}

message(
  "Antal parkgeometrier efter beskæring: ",
  nrow(parks_clipped)
)


# ------------------------------------------------------------
# 13. Gem resultatet
# ------------------------------------------------------------

st_write(
  obj = parks_clipped,
  dsn = output_file,
  layer = output_layer,
  delete_layer = TRUE,
  quiet = TRUE
)

message(
  "Parkerne er gemt i: ",
  output_file
)


# ------------------------------------------------------------
# 14. Kontrollér resultatet med et kort
# ------------------------------------------------------------

park_map <- ggplot() +
  geom_sf(
    data = bydele,
    fill = "grey95",
    color = "grey40",
    linewidth = 0.3
  ) +
  geom_sf(
    data = parks_clipped,
    fill = "darkgreen",
    color = NA,
    alpha = 0.7
  ) +
  coord_sf(
    datum = NA
  ) +
  theme_minimal() +
  labs(
    title = "Parker i København og Frederiksberg",
    subtitle = "OpenStreetMap: leisure = park",
    caption = "Data: OpenStreetMap"
  )

print(park_map)


# ------------------------------------------------------------
# 15. Valgfri kontrol af navngivne parker
# ------------------------------------------------------------

if ("name" %in% names(parks_clipped)) {

  named_parks <- parks_clipped |>
    st_drop_geometry() |>
    filter(
      !is.na(name),
      name != ""
    ) |>
    distinct(name) |>
    arrange(name)

  print(named_parks)
}