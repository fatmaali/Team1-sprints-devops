echo "Enter country 1)US 2)Germian 3)itali"
select country in US Germian itali; do
  case $country in
  US)
    echo "English"
    ;;
  Germian)
    echo "Germian"
    ;;
  itali)
    echo "italian"
    ;; 
  *)
    echo "Enter valid country"
    ;;
  esac
  break
done
