shopt -s extglob 
echo "Please enter first name" 
read fsName 
until [[ "$fsName" == +([[:alpha:]]) ]]; do
    echo "Please enter string" 
    read fsName
done 

echo "Please enter last name" 
read lsName 
until [[ "$lsName" == +([[:alpha:]]) ]]; do
    echo "Please enter string" 
    read lsName
done 


echo "Please enter phone"
read phone 

dbPhone=$(awk -F "," '$3=='$phone' {print $3}' ./DB.csv)

while [[  "$phone" == +([[:digit:]])  ]];
 do
    
        if [ -z $dbPhone ]
        then

            break
        fi

    echo "Phone is not valid ,please enter another one" 
    read phone

    dbPhone=$(awk -F "," '$3=='$phone' {print $3}' ./DB.csv)
done 

echo "Please enter department" 
read dep 
until [[ "$dep" == +([[:alpha:]]) ]]; do
    echo "Please enter string" 
    read dep
done 

echo "Please enter salary" 
read salary 
until [[ "$salary" == +([[:digit:]]) ]]; do
    echo "Please enter number" 
    read salary
done 

echo "$fsName,$lsName,$phone,$dep,$salary" >> ./DB.csv
echo "insertion done successfully"