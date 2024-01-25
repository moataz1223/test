echo "I will now back up your home directory, $HOME"

location=$(pwd)
timestamp=$(date +"%Y%m%d%H%M%S")
echo "I will create save the backup file in $location"

tar -cf "$loction/my_backup_$timestamp.tar" $HOME

echo "Backup completed successfully"
