echo "Please enter ID "
read ID

id=`awk -F "," '$1=='$ID' {print $1}' ./DB.csv`

while [ -z $id ]
do

    echo "wrong id, please enter a valid one : "
    read ID
    id=`awk -F "," '$1=='$ID' {print $1}' ./DB.csv`

done

name=`awk -F "," '$1=='$ID' {print $2}' ./DB.csv`
password=`awk -F "," '$1=='$ID' {print $3}' ./DB.csv`

echo "Hello $name ,please enter old password :"

read oldPass

while [ $oldPass != $password ]
do
  
    echo "wrong password, please enter a correct password : "
    read oldPass

done


echo "Correct, enter the new password : "
read newPass


oldData=`awk -F "," '$1=='$ID' {print $0} ' ./DB.csv`
newData=`awk -F "," '$1=='$ID' {gsub($3, inp); print} ' inp="${newPass}" ./DB.csv`

sed -i "s/$oldData/$newData/g" ./DB.csv

echo "password changed successfully"
