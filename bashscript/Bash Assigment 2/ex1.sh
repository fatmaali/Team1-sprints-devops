echo "Enter one char:"
read -n1  var

case $var in
[0-9])
    echo "char is number"
    ;;
[A-Z])
    echo "char is upper case"
    ;;
 [a-z])
    echo "char is lowercase case"
    ;;

*)
    echo "No thing"
    ;;
esac
