#for repermissioning a whole directory recursively \
for i in $(find . -type d -print); do
    declare  permission=$(stat -c %A $i)
    if [ $permission !=  "drwxr-xr-x" ]
        then echo "Directory" $i "has wrong permission:" $permission
        chmod a+rx,u+w $i
        echo "This has been changed to" $(stat -c %A $i)
    fi
done

for j in $(find . -type f -print); do
    declare  permission2=$(stat -c %A $j)
    if [ $permission2 !=  "-rw-r--r--" ]
        then echo "File" $j "has wrong permission:" $permission2
	chmod a+r,u+w $j
	echo "This has been changed to" $(stat -c %A $j)
    fi
done
