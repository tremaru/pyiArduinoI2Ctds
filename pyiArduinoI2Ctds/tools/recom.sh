#!/bin/bash
#script for recomening C to Python
#cutting extension from file passed to script
FILENAME="$(echo $1 | cut -d "." -f 1)"

#deleting all instances of octothorp,
# replacing all instances of doubleslash with octothorp,
# replacing all semicolons with blank
# outputting to file

awk '{ gsub("#",""); print $0}' $1 \
	| awk '{ gsub("//","#"); print $0}' \
	| awk '{ gsub(";"," "); print $0}' \
	| sed 's/iarduino_I2C_TDS/pyiArduinoI2Ctds/g' \
	| sed 's/Serial.//' \
	| sed 's/include/from/g' \
	> $FILENAME.py


