#!/bin/bash
set -e

outfile="planet-latest-stats.csv"

echo "fetching the latest world file"

wget -O planet-latest.osm.pbf --continue http://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/pbf/planet-latest.osm.pbf

echo "splitting the world into 1x1 degrees blocks"
./lsplitter.sh

echo "create the csv"
./generate_stats.sh lsplitter-outdir/ ${outfile}
