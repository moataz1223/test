#!/bin/bash

Random() {
  echo ${1:RANDOM%${#1}:1}
}

lowercase='abcdefghijklmnopqrstuvwxyz'
uppercase='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
digits='0123456789'
special='!@#$%^&*()_+-=[]{}|;:,.<>?'
length=12
complexity=2

while getopts l:c: opt
do
  case "${opt}"
  in
    l) length=${OPTARG};;
    c) complexity=${OPTARG};;
  esac
done

if [[ $complexity -lt 1 || $complexity -gt 5 ]]
then
  echo "Invalid complexity level (1-5)."
  exit 1
fi

if [ $((complexity & 1)) -eq 0 ]
then
  ((complexity++))
  special=$(Random "$special")
fi
if [ $((complexity & 2)) -eq 0 ]
then
  ((complexity+=2))
  digits=$(Random "$digits")
  lowercase=$(Random "$lowercase")
fi
if [ $((complexity & 4)) -eq 0 ]
then
  ((complexity+=4))
  uppercase=$(Random "$uppercase")
fi

password=$(Random "$special")$passwprd
password=$(Random "$digits")$password
password=$(Random "$lowercase")$password
password=$(Random "$uppercase")$password

for i in $(seq 1 $((length - complexity)))
do
  group=$(Random "$lowercase$uppercase$digits$special")
  password=$group$password
done

password=$(echo "$password" | fold -w1 | shuf | tr -d '\n')

echo " Generate the password: $password"
