echo "Enter 3charter String"
read -n3 var
case $var in
[0-9][0-9][0-9])
    echo "char is number"
    ;;
[A-Z][A-Z][A-Z])
    echo "char is upper case"
    ;;
[a-z][a-z][a-z])
    echo "char is lowercase case"
    ;;
[a-z]*[0-z]*[0-z]|[A-Z]*[0-z]*[0-z])
    echo "char is mix"
    ;;

*)
    echo "No thing"
    ;;
esac

