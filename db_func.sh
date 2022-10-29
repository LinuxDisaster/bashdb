#!/bin/bash

DATABASE_FILE=.database

let MAX_SIZE_OF_KEY=10
let MAX_SIZE_OF_VALUE=10

function db_clear() {
  rm -f "$DATABASE_FILE"
}
 
function db_set() {
  key_length=$(expr length "$1")
  value_length=$(expr length "$2")
  if (( ("$key_length" > "$MAX_SIZE_OF_KEY") | ("$value_length" > "$MAX_SIZE_OF_VALUE") )); then
    if (( "$key_length" > "$MAX_SIZE_OF_KEY" )); then
	  echo "Size of key should not be greater than $MAX_SIZE_OF_KEY symbols"
	fi
	if (( "$value_length" > "$MAX_SIZE_OF_VALUE" )); then
	  echo "Size of value should not be greater than $MAX_SIZE_OF_VALUE symbols"
	fi
  else
    echo "$1,$2" >> "$DATABASE_FILE"
  fi
}
 
function db_get() {
  grep "^$1," "$DATABASE_FILE" | sed -e "s/^$1,//" | tail -n 1
}
 
function db_remove() {
  db_set $1 ""
}
