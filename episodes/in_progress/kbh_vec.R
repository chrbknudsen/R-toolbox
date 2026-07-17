library(sf)
library(osmdata)
library(dplyr)

kbh <- st_read(
  "https://wfs-kbhkort.kk.dk/k101/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=k101:bydel&outputFormat=json&SRSNAME=EPSG:4326",
  quiet = TRUE
)

kbh

frb <- getbb(
  "Frederiksberg Kommune, Danmark",
  format_out = "sf_polygon",
  limit = 1
)

navnefelt <- grep(
  "navn",
  names(kbh),
  ignore.case = TRUE,
  value = TRUE
)[1]

områder <- rbind(
  st_sf(
    navn = kbh[[navnefelt]],
    geometry = st_geometry(kbh)
  ),
  st_sf(
    navn = "Frederiksberg",
    geometry = st_geometry(frb)
  )
)

områder$navn

befolkning <- tribble(
  ~navn,                ~befolkning,
 "Indre By", 58224,
 "Nørrebro",79779 ,
 "Vanløse", 40847, 
 "Brønshøj-Husum", 44975,
 "Bispebjerg", 55985,
 "Amager Øst", 64254,
 "Amager Vest", 92300,
 "Vesterbro-Kongens Enghave", 85072,
 "Valby", 66321,
 "Østerbro", 76402  ,
"Frederiksberg"   , 106150

  
)

områder <- områder |>
  left_join(
    befolkning,
    by = "navn"
  )

områder


st_write(
  områder,
  "episodes/data/bydele_and_frederiksberg.gpkg",
  layer = "områder",
  delete_layer = TRUE,
  quiet = TRUE
)
