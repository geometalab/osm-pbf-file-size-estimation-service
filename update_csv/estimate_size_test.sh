#!/bin/bash

set -e

infile='planet-latest-stats.csv'
script_file='python ./estimate_size.py'

tests_passed='true'

print_error() {
	echo "ERROR: $1 Expected $2 but got ${3}. Issued command was: $4"
	tests_passed='false'
}

cmd="${script_file} ${infile} 8 47 9 48"
size_expected=96219582
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then
	print_error "Check for bbox exactly on 1x1 tile grid failed." ${size_expected} ${size_actual} "$cmd"
fi

cmd="${script_file} ${infile} 7.9999 46.9999 9.0001 48.0001"
size_expected=96244875
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then
	print_error "Check for bbox slightly larger than 1x1 tile grid failed." ${size_expected} ${size_actual} "$cmd"
fi

cmd="${script_file} ${infile} 8.0001 47.0001 8.9999 47.9999"
size_expected=96181099
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then
	print_error "Check for bbox slightly smaller than 1x1 tile grid failed." ${size_expected} ${size_actual} "$cmd"
fi

cmd="${script_file} ${infile} -44 -23 -43 -22"
size_expected=11230291
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then
	print_error "Check for bbox exactly on 1x1 tile grid with negative coordinates failed." ${size_expected} ${size_actual} "$cmd"
fi

cmd="${script_file} ${infile} 8 47 10 49"
size_expected=335713244
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then
	print_error "Check for bbox exactly on 2x2 tile grid failed." ${size_expected} ${size_actual} "$cmd"
fi

cmd="${script_file} ${infile} -180 -90 179 89"
size_expected=29202942611
size_actual=$($cmd)
if [[ "${size_actual}" -ne "${size_expected}" ]]; then # can't do integer comparison here!
	print_error "Check for bbox covering the whole planet failed." ${size_expected} ${size_actual} "$cmd"
fi

echo
if [[ ${tests_passed} == "true" ]]; then
    echo "Tests passed"
else
    echo "Tests failed"
fi
