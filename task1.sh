
read -p "please enter path the file : " file

if [ -f "$file"  ]
then
ls -l $file
echo -e  "\e[31m Permissions : $(ls -l "$file" | cut -d " " -f1) \e[0m"
echo -e "\e[32m  File Links : $(ls -l "$file" | cut -d " " -f2) \e[0m"
echo -e "\e[33m File  Owner : $(ls -l "$file" | cut -d " " -f3)\e[0m"
echo -e "\e[34m File  Size : $(ls -l "$file" | cut -d " " -f5)\e[0m"
echo -e "\e[35m File  Type : $(file -b $file)\e[0m"
    echo "All infromation about the file has been displayed successfully"
else
    echo "Not file"
    exit
fi
