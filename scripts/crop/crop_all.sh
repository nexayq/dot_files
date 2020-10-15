#!/bin/bash


mkdir -p out

for f in $(find . -iname '*.png'); do convert "$f" -crop 980x510+70+100 +repage out/"$f"_crop.png; done
# convert  a.png -crop 980x510+70+100 +repage a_crop.png
