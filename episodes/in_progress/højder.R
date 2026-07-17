library(terra)

# forudsætter at vi har de relevante zip-filer liggende fra DHM.

zip_dir <- "."
output_file <- "danmark_dhm_10m.tif"

target_resolution <- 10

zip_files <- list.files(zip_dir, pattern = "\\.zip$")


tiffs_in_zip <- function(zip_file) {

  zip_contents <- utils::unzip(
    zip_file,
    list = TRUE
  )

  tif_names <- zip_contents$Name[
    grepl("\\.tiff?$", zip_contents$Name, ignore.case = TRUE)
  ]

  zip_path <- normalizePath(
    zip_file,
    winslash = "/",
    mustWork = TRUE
  )

  paste0(
    "/vsizip/",
    zip_path,
    "/",
    tif_names
  )
}


tif_files <- unlist(
  lapply(zip_files, tiffs_in_zip),
  use.names = FALSE
)



vrt_file <- file.path(
  zip_dir,
  "danmark_dhm_original.vrt"
)

dhm <- terra::vrt(
  tif_files,
  filename = vrt_file,
  overwrite = TRUE
)





original_resolution <- res(dhm)

factor_xy <- target_resolution / original_resolution

if (any(abs(factor_xy - round(factor_xy)) > 1e-7)) {
  stop(
    "Den ønskede opløsning er ikke et helt multiplum ",
    "af rasterets oprindelige opløsning."
  )
}

# aggregate() forventer rækkefølgen række, kolonne,
# altså y-faktor efterfulgt af x-faktor
factor_row_col <- round(
  c(factor_xy[2], factor_xy[1])
)




dhm_10m <- terra::aggregate(
  dhm,
  fact = factor_row_col,
  fun = "mean",
  na.rm = TRUE,
  filename = output_file,
  overwrite = TRUE,
  wopt = list(
    datatype = "FLT4S",
    NAflag = -9999,
    gdal = c(
      "TILED=YES",
      "COMPRESS=DEFLATE",
      "PREDICTOR=3",
      "BIGTIFF=IF_SAFER"
    )
  )
)



library(geodata)
dhm_10m <- rast("danmark_dhm_10m.tif")
dhm_10m
plot(dhm_10m)



områder <- vect(
  "bydele_and_frederiksberg.gpkg",
  layer = "områder"
)

områder <- project(
  områder,
  crs(dhm_10m)
)







dhm_kbh_frb <- crop(
  dhm_10m,
  områder,
  mask = TRUE,
  filename = "dhm_koebenhavn_frederiksberg_10m.tif",
  overwrite = TRUE,
  wopt = list(
    datatype = "FLT4S",
    NAflag = -9999,
    gdal = c(
      "TILED=YES",
      "COMPRESS=DEFLATE",
      "PREDICTOR=3"
    )
  )
)

