#!/bin/bash

DB_FUNC="./db_func.sh"
if [ ! -f "$DB_FUNC" ]; then
    echo "$DB_FUNC not found"
    exit 1
fi
source "$DB_FUNC"

#begin of input/output
db_clear

key=keyyyy
value=value11
db_set $key $value
# key=key1
echo keyyyy=$(db_get keyyyy)  
 
db_set key key2
# key=key2
echo key=$(db_get key)
 
db_set name helloacm
db_set age 20
 
# name=helloacm
echo name=$(db_get name)
# age=20
echo age=$(db_get age)
# 404=
echo 404=$(db_get 404)

echo $(db_remove age)
echo age=$(db_get age)

db_change name misha
echo name=$(db_get name)

 
echo DATBASE contents
# key,key1
# key,key2
# name,helloacm 
# age,20
cat "$DATABASE_FILE"
echo "---------db_show---------"
db_show
echo "---------db_head---------"
db_head 2
echo "---------db_tail---------"
db_tail 2