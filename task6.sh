#!/bin/bash

read -ep "Enter The Directory : " Directory

if [ -d "$Directory" ]
then
     echo "done"
cd $Directory

read -p  "please enter  input file : " file
read -p  "please enter  output file: " output_file
if [ -f $file ]
then
for ((i=1; i <= 1; i++))
do
    echo "Iteration $i:"
    if [ $i -eq 1 ]; then
        amass enum -d "$file" -o tmp_subdomains.txt
        subfinder -d "$file" -o tmp_subdomains.txt
    fi
done

cat tmp_subdomains.txt | sort -u > "$output_file"
total_subdomains=$(wc -l < "$output_file")

echo -e "\e[32m Total unique subdomains found: $total_subdomains \e[0m"
echo -e "\e[31 Unique subdomains saved to: $output_file \e[0m"

else
echo -e "\e[42m File does not exist or is not a regular file.\e[0m"
fi
else
      echo "not directory"
fi
