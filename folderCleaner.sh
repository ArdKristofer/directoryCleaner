#! /bin/bash

echo ""
echo "This program will help to analyze and clean your directories."
echo ""

# Ask the user which directory they want to analyze and 
# change to that directory. Print the working directory
# to the user.
read -p "Which directory are you looking to analyze?: " folder
echo ""
cd
cd $folder
pwd

# List items in the directory and sort them by size, and
# give the user the option to delete files smaller than 2mb, 
# larger than 2mb, or delete everytihing in the directory
ls -lhS
echo ""
echo "1. Delete files smaller than 2MB"
echo "2. Delete files larger than 2MB"
echo "3. Delete all files"
read -p "Which option would you like to apply to this directory?: " option
echo ""

# Based on the user's selection, choose what happens :)
if [ "$option" == '1' ]; then
    find ~/$folder -type f -size -2M
    echo ""
    read -p "Are you sure you want to delete these files? (Y/n) " response
    if [ "$response" == 'Y' ] || [ "$response" == 'y' ]; then
        echo "You chose to delete the selected files"
        find ~/$folder -type f -size -2M -delete
        find ~/$folder -type d -empty -exec rmdir {} \;
        echo "Complete! All files smaller than 2MB have been deleted."
    else
        echo "You chose not to delete the files."
    fi
elif [ "$option" == '2' ]; then
    find ~/$folder -type f -size +2M
    echo ""
    read -p "Are you sure you want to delete these files? (Y/n) " responseTwo
    if [ "$responseTwo" == 'Y' ] || [ "$responseTwo" == 'y' ]; then
        echo "You chose to delete the selected files"
        find ~/$folder -type f -size +2M -delete
        find ~/$folder -type d -empty -exec rmdir {} \;
        echo "Complete! All files larger than 2MB have been deleted."
    else
        echo "You chose not to delete the files."
    fi
fi