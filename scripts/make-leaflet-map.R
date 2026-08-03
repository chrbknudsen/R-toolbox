library(leaflet)
library(htmlwidgets)

set.seed(123)

punkter <- data.frame(
  navn = paste("Punkt", 1:10),
  lon = runif(10, 12.45, 12.65),
  lat = runif(10, 55.62, 55.73),
  vaerdi = sample(10:100, 10)
)

kort <- leaflet(punkter) |>
  addTiles() |>
  addCircleMarkers(
    lng = ~lon,
    lat = ~lat,
    radius = ~sqrt(vaerdi),
    label = ~navn,
    popup = ~paste0(
      "<strong>", navn, "</strong><br>",
      "Værdi: ", vaerdi
    ),
    fillOpacity = 0.7
  )

dir.create(
  "episodes/files",
  recursive = TRUE,
  showWarnings = FALSE
)

htmlwidgets::saveWidget(
  widget = kort,
  file = "episodes/files/leaflet-eksempel.html",
  selfcontained = TRUE,
  title = "Eksempel på Leaflet-kort"
)