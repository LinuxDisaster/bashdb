#!/bin/bash

function open_file() {
	FILE="$1"
	if [ ! -f "$FILE" ]; then
		echo "$FILE not found"
		exit 1
	fi
	source "$FILE"
}

DB_FUNC="./db_func.sh"
open_file $DB_FUNC

function is_empty_key() {
	if [ ! -n "$1" ]; then
		echo "Expected KEY parametr"	
		return 1
	else
		#echo "Found $1 KEY parametr"
		return 0
	fi
}

function is_empty_value() {
	if [ ! -n "$1" ]; then
		echo "Expected VALUE parametr"	
		return 1
	else
		#echo "Found $1 VALUE parametr"
		return 0
	fi
}


case "$1" in
"-set") 
	#echo "Found set option"
	key="$2"
	value="$3"
	if is_empty_key $key && is_empty_value $value; then
		db_set $key $value
	else
		exit
	fi
;;
"-change") 
	#echo "Found set option"
	key="$2"
	value="$3"
	if is_empty_key $key && is_empty_value $value; then
		db_change $key $value
	else
		exit
	fi
;;
"-remove") 
	#echo "Found set option"
	key="$2"
	if is_empty_key $key; then
		res=$(db_remove $key)
	else
		exit
	fi
;;
"-get")
	shift
	if (( $# <= 1 )); then
		key="$1"
		if is_empty_key $key; then
			db_get $key
		else
			exit
		fi
	else
		if [[ "$1" == "-f" ]]; then
			LIST_OF_KEYS="$2"
			for key in $(cat $LIST_OF_KEYS)
			do
				echo "$key,$(db_get $key)"
			done
		else
			echo "$1 is not a option"
			exit
		fi
	fi
;;
"-show") 
	#echo "Found set option"
	db_show
;;
"-head") 
	rows="$2"
	db_head $rows
;;
"-tail") 
	rows="$2"
	db_tail $rows
;;
"-clear") 
	db_clear
;;
*)
	echo "$1 is not a option"
;;
esac