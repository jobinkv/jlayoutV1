# Document Image Segmentation Tool
An awesome list of deep learning resources

## Table of Contents
* **[Introduction](#Introduction)** 
* **[How to use](#How to use)** 
* **[Papers](#papers)**

### Introduction
A new hybrid page layout analysis algorithm is
proposed, which uses bottom-up methods to form an
initial data-type hypothesis and locate the tab-stops
that were used when the page was formatted. The
detected tab-stops, are used to deduce the column
layout of the page. The column layout is then applied
in a top-down manner to impose structure and
reading-order on the detected regions.
The complete C++ source code implementation is
available as part of the Tesseract open source OCR
engine at http://code.google.com/p/tesseract-ocr.


### Papers
* [The core idea in the segmentation technique](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/35094.pdf).

## Note:
Those who are interested to use this code for getting word, line, and block bountary cordinate.
I highly recomented to use the PyTessBaseAPI as simple and eazy way to get the boundary information.

### Sample code
```javascript
from PIL import Image
import cv2
import sys
import locale
locale.setlocale(locale.LC_ALL, 'C')
from tesserocr import PyTessBaseAPI, RIL
import numpy as np
"""
Usage : python pythonSegmentation.py image_file segment_file outputType
image_file - Path to image file for which segmentation is to be performed
segment_file - Path to text file on which segmentation result is to be stored
outputType - Tells which type of segmentation to be performed
            1 : Blocks segmentation
            2 : Line segmentation
            3 : Word segmentation
"""
image_file = sys.argv[1]
segment_file = sys.argv[2]
outputType = int(sys.argv[3])

image = Image.open(image_file)



with PyTessBaseAPI() as api:
    api.SetImage(image)
    segment_fl = open(segment_file, "w+")

    if outputType == 1:
        blocks = api.GetComponentImages(RIL.BLOCK, True)
    elif outputType == 2:
        blocks = api.GetComponentImages(RIL.TEXTLINE, True)
    else:
        blocks = api.GetComponentImages(RIL.WORD, True)
    
    for i, (im, box, _, _) in enumerate(blocks):
        # im is a PIL image object
        # box is a dict with x, y, w and h keys
        api.SetRectangle(box['x'], box['y'], box['w'], box['h'])
        segment_fl.write("{x}\t{y}\t{w}\t{h}\n".format(x=box['x'], y=box['y'], w=box['w'], h=box['h']))

```
