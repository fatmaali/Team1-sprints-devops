if [ $# -eq 1 ]
then
echo "Check if the file is writable"
test -w $1 && echo "true" || echo "false"
echo "Check if the file is executable"
test -x $1 && echo "true" || echo "false"
echo "Check if the file is readable"
test -r $1 && echo "true" || echo "false"
elif [ $# -le 1 ]
then
    echo "No file entered"
elif [ $# -gt 1 ]
then
    echo "too many args"    
fi