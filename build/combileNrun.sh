#!/bin/bash
cd ../codes
make
cp j-layout ../build/
cd ../build
./j-layout 8331_028.2B.tif
