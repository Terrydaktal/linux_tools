if [ $# -eq 1 ]
then
    directory=$1
else
    echo -n "Enter a directory :"
    read directory
fi

cd $directory
echo $PWD

declare -i files=$(find .//. -type f -print | grep -c //)
declare -i hiddenfiles=$(find .//. -type f -iname ".*" -ls | grep -c //)
declare -i directories=$(find .//. -type d -print | grep -c //)
declare -i hiddendirectories=$(find .//. -type d -iname ".*" -ls | grep -c //)
declare -i total=$(find .//. ! -name . -print | grep -c //)

echo "There are" $((files-1)) "files"
echo "There are" $((hiddenfiles-1))  "hidden files"
echo "There are" $((directories-1)) "directories"
echo "There are" $((hiddendirectories-1)) "hidden directories"
echo "There are" $((total-1)) "total items"
