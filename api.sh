#!/bin/bash

DB_FUNC="./db_func.sh"
if [ ! -f "$DB_FUNC" ]; then
    echo "$DB_FUNC not found"
    exit 1
fi
source "$DB_FUNC"

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
"set") 
	#echo "Found set option"
	key="$2"
	value="$3"
	if is_empty_key $key && is_empty_value $value; then
		db_set $key $value
	else
		exit
	fi
;;
"change") 
	#echo "Found set option"
	key="$2"
	value="$3"
	if is_empty_key $key && is_empty_value $value; then
		db_change $key $value
	else
		exit
	fi
;;
"remove") 
	#echo "Found set option"
	key="$2"
	if is_empty_key $key; then
		res=$(db_remove $key)
	else
		exit
	fi
;;
"get") 
	#echo "Found set option"
	key="$2"
	if is_empty_key $key; then
		db_get $key
	else
		exit
	fi
;;
"show") 
	#echo "Found set option"
	db_show
;;
"head") 
	rows="$2"
	db_head $rows
;;
"tail") 
	rows="$2"
	db_tail $rows
;;
*)
	echo "$1 is not a option"
;;
esac