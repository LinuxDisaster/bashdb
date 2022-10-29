#!/bin/bash

DATABASE_FILE=.database

let MAX_SIZE_OF_KEY=10
let MAX_SIZE_OF_VALUE=10

function check_key() {
  if (( "$(expr length "$1")" > "$MAX_SIZE_OF_KEY" )); then
	  echo "Lenght of KEY should not be greater than $MAX_SIZE_OF_KEY symbols"
	  return 1
  else
    return 0;
  fi
}

function check_value() {
  if (( "$(expr length "$1")" > "$MAX_SIZE_OF_VALUE" )); then
	  echo "Lenght of VALUE should not be greater than $MAX_SIZE_OF_VALUE symbols"
      return 1
  else
    return 0;
  fi
}

function is_less() {
  if (( "$(expr length "$1")" > "$2" )); then
	  echo "Lenght of $1 should not be greater than $MAX_SIZE_OF_VALUE symbols"
      return 1
  else
    return 0;
  fi
}


function db_clear() {
  rm -f "$DATABASE_FILE"
}
 
function db_set() {
  if check_key $1 && check_value $2; then
    echo "$1,$2" >> "$DATABASE_FILE"
  else
    exit
  fi
}
 
function db_get() {
  grep "^$1," "$DATABASE_FILE" | sed -e "s/^$1,//" | tail -n 1 #; then
    #echo "$1 key is in DB"
  #else
    #echo "$1 key is not in DB"
  #fi
}
 
function db_remove() {
  db_set $1 ""
}

function db_change() {
  db_set $1 $2
}

function db_get_key() {
  head -$1 "$DATABASE_FILE" | tail +$1 | sed -e "s/,[A-Za-z0-9]*//"
}

function db_show() {
  #list_of_keys=$(sed "s/,[A-Za-z0-9\n\r]*//" "$DATABASE_FILE")
  #echo "$list_of_keys"
  #len=${#list_of_keys[@]}
  len=0
  for key in $(sed -e "s/,[A-Za-z0-9]*//" "$DATABASE_FILE" | sort -u)
  do
  if  [ ! -z "$(db_get $key)" ]; then
    (( len++ ))
    echo "$key, $(db_get $key)"
  fi
  done
  #echo $len
}

function db_show_2() {
  #local list_of_keys=$(sed -e "s/,[A-Za-z0-9]*//" "$DATABASE_FILE")
  #len=${#list_of_keys[@]}
  
  for (( i=0; i < len; i++ ))
  do
    
    echo "$list_of_keys[i], $(db_get $list_of_keys[i])"
  done
}
