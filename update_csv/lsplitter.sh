#!/bin/bash

set -e

export infile='planet-latest.osm.pbf'
export tmpdir='lsplitter-tmpdir' # directory for temporary "stripes"
export outdir='lsplitter-outdir' # directory for final tiles
parallel_options="-v --noswap"

split_one_degree_pole2pole() {
	minlat=-90
	minlon=$1
	maxlat=90
	maxlon=$(($minlon+1))
	export TIMEFORMAT=%R # http://stackoverflow.com/a/3795634
	osmium extract --overwrite -b "$minlon,$minlat,$maxlon,$maxlat" $infile -o $tmpdir/out_${minlon}.pbf
}

split_into_one_by_one_degree() {
	minlat=$1
	minlon=$2
	maxlat=$(($minlat+1))
	maxlon=$(($minlon+1))
	export TIMEFORMAT=%R # http://stackoverflow.com/a/3795634
	osmium extract --overwrite -b "$minlon,$minlat,$maxlon,$maxlat" $tmpdir/out_${minlon}.pbf -o $outdir/out_${minlat}_${minlon}.pbf
}

mkdir -p $outdir
mkdir -p $tmpdir

export TIMEFORMAT=%R # http://stackoverflow.com/a/3795634
for lon in $(seq -180 179)
do
	echo "slice $lon"
	time split_one_degree_pole2pole $lon
	for lat in $(seq -90 89)
	do
		echo "splits for $lat $lon"
 		time split_into_one_by_one_degree $lat $lon
	done
done
