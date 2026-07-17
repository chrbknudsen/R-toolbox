library(sf)
library(osmdata)

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

st_write(
  områder,
  "bydele_and_frederiksberg.gpkg",
  layer = "områder",
  delete_layer = TRUE,
  quiet = TRUE
)