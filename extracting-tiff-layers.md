---
title: "Extracting tiff-layers"
teaching: 0
exercises: 0
---

::::questions
- How do I extract layers from a tiff-file?
::::


::::objectives
- Demonstrate how to extract layers from tiff-files
::::

::::::::::::::::::::::::::::::::::::: keypoints 

- Layered tiff-files can contain different information

::::::::::::::::::::::::::::::::::::::::::::::::


Tiff (sometimes tif) is a lossless image file format for storing raster graphics. Originally it was designed as a
common format for manufacturers of scanners. Currently it is popular among photographers as an alternative to lossy
formats like jpg and png. From the start it allowed for storing several images in one file, eg scans in different resolutions or multiple pages of a multi-page document. 

What is relevant here, is the application of storing different images of the same object in the same file. It is a 
popular format for storing satelite imagery, where each layer contains different exposures of the same geographical area. Layers can be split by color, where a layer containing the green channel of an rgb-image, can make it easier to
identify vegetation. 

Layers can also contain different spectral channels, eg infrared in one channel and visible light in another.

All this makes it relevant to be able to split a tiff-file in its individual layers. Several applications supports this (and other manipulation of the files):

- [LibTIFF](https://libtiff.gitlab.io/libtiff)
- [GIMP](https://www.gimp.org)
- [ImageMagick](https://imagemagick.org)

One library for Python supporting this is [Pillow](https://pypi.org/project/pillow/)

In R we use the library `raster`: 


``` r
library(raster)
```

``` output
Loading required package: sp
```


Here is an example of a layered tif:

![Femlagstiff](../fig/poppendorf_5_band.tif)

We use the `stack` function to read the file:


``` r
tif <- stack("episodes/fig/poppendorf_5_band.tif")
```

``` warning
Warning: episodes/fig/poppendorf_5_band.tif: No such file or directory (GDAL
error 4)
```

``` error
Error in `.rasterObjectFromFile()`:
! Cannot create a RasterLayer object from this file. (file does not exist)
```


This specific file contains 5 layers:


``` r
raster::nlayers(tif)
```

``` error
Error in `h()`:
! error in evaluating the argument 'x' in selecting a method for function 'nlayers': object 'tif' not found
```

Each layer have name:


``` r
names(tif)
```

``` error
Error:
! object 'tif' not found
```

In some tiff-files they do not have names, but numbers.


We can plot the layers individually:


``` r
plot(tif$poppendorf_5_band_1)
```

``` error
Error in `h()`:
! error in evaluating the argument 'x' in selecting a method for function 'plot': object 'tif' not found
```

And we can save the individual layers in separate files:


``` r
writeRaster(tif$poppendorf_5_band_1, "filename.tif")
```


## Note

This file is taken from the library `plainview`. More specifically it is part of a 
collections of sattelite images from Landsat 8, of the village Poppendorf, located a bit to the right of Rostock in Germany.

The individual layers are images captured in different parts of the electromagnetic spectrum, both visible light and near infra red.

Original Landsat images can be accessed from [USGS](https://www.usgs.gov/landsat-missions). Note that this example is colored with 
false colors, and stacked into a single file. Most data from USGS are provided in individual images for each "band" of the spectrum.

Please remember that not all TIFF-files have multiple layers. If you can only extract a single layer, it might be because there
is only one layer in it.
