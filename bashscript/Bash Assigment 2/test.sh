echo "enter number from 1-10:"
OUTPUT=$(ls -1)
echo "${OUTPUT}"
while [ $var -ne 6 ]
do
    echo "wrong answer,Please try again"
    read var
done
echo "right answer ,well done!!!!"
