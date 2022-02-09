shopt -s extglob

echo "enter your string:"
read  var

case $var  in

        +([[:upper:]]) )
         echo    "upper case "                                    
                ;;
                #same way to match one char
        +([[:lower:]]) )
        echo   "low case "          
                ;;
        +([[:alpha:]]) )
                echo "mix char upper and lower"
                ;;
        +([[:digit:]]) )
        echo    "integer "                                     
        ;;
        +([[:alnum:]]) )
                echo "mix int and upper and lower"
                ;;
        *)
        echo wrong data
        ;;
esac
