#!/bin/bash
select weekdays in Saturday Sunday Monday Tuesday Wednesday Thursday Friday; do
    case $weekdays in
        Saturday)
            echo "Happy weekend day"
            ;;
        Sunday)
            echo "Hello,today is Sunday"
            ;;
        Monday)
            echo "Hello,today is Monday"
            ;;
        Tuesday)
            echo "Hello,today is Tuesday"
            ;;
        Wednesday)
            echo "Hello,today is Wednesday"
            ;;
        Thursday)
            echo "Hello,today is Thursday"
            ;;
        Friday)
            echo "Happy weekend day"
            ;;
        *)
            echo "not a day"
            ;;
    esac
break
done
