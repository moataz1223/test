read -ep "Enter The Directory Path : " Directory_path

if [ -d "$Directory_path" ]
then
     echo "done "
cd $Directory_path
read -p "Enter name the file : " file
if [ -f $file -o -d $Directory ]
then
select opt in exiftool  strings  tcpdump mediainfo
do
    case $opt in
      exiftool)
     echo -e "\e[31;43m exifTool is a command-line tool for reading, writing, and editing metadata information in files. It supports a wide variety of file formats, including images, video. \e[m0"
     sleep 10
     exiftool  $file
       ;;
      strings)
      echo -e "\e[34m he strings command  that extracts printable character sequences from binary files. It is often used to analyze binary files.\e[0m"
      sleep 10
      strings $file
       ;;
       tcpdump)
       echo -e  "\e[1;33m tcpdump is a command-line packet analyzer it allows users to display and analyze the network traffic flowing into and out of a computer \e[0m"
       sleep 10
       echo -e  "\e[41m  Please wait 30 seconds then press 'control + c ' so the the file reads and displays the packges \e[0m"
      sudo tcpdump -w $file
      sudo tcpdump -r $file | uniq
       ;;
       mediainfo)
      echo -e "\e[1;33m tool used to analyze and display technical and tag data for audio and video files. It provides detailed information about various aspects of a media file \e[0m"
      sleep 10
      mediainfo $file
       ;;

      *)
       echo -e  "\e[31m Invaild option \e[0m "
      ;;
     esac
done
else
     echo -e "\e[42m File does not exist or is not a regular file.\e[0m"
fi
else

    echo -e  "\e[31m Not directory \e[0m"
fi

#select opt in strings Exiftool
#do
 # if [ "$opt" == "strings" ]
  #then
   #     echo "kdfsklmns"
  # strings $file
 # fi
#done

