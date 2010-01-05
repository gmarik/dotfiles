for f in *.JPG; do
  nice -n20 convert -resize $1 +profile '*' $f out-$f
done
