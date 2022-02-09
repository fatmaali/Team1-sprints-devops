shopt -s extglob

echo "enter your charcter:"
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
       
        *)
        echo wrong data
        ;;
esac
