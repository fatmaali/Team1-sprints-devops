echo "Enter fruit 1)apple 2)banana 3)kiwi"
select fruit in apple banana kiwi quite; do
  case $fruit in
  apple)
    echo "Enter color"
    select col in red green yellow; do
      case $col in
      red)
        echo "red apple"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;

      green)
        echo "green apple"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;

      yellow)
        echo "yellow apple"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;
      *)
        echo "error"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;
      esac
    done
    ;;
  banana)
    echo "Enter color"
    select bcol in green yellow; do
      case $bcol in
      yellow)
        echo "yellow banana"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;
      green)
        echo "green banana"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;
      *)
        echo "error"
        echo "Enter fruit 1)apple 2)banana 3)kiwi"
        break
        ;;

      esac
    done
    ;;
  kiwi)
    echo "kiwi"
    ;;
  quite)
      echo "exited"
    break
    ;;

  
  *)
    echo "Enter one of the 3 fruits above"
    ;;
  esac
done
