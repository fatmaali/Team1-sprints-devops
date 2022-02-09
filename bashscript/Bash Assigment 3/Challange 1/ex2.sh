
# !/bin/bash
for ((a=1; a <= 25 ; a++))
do
touch "./expectedFiles/Fatma"$a
done
###################################################################
C=$(find './expectedFiles' -name 'Fatma*' -type f|wc -l)
plus="$(($C + 25))"
for ((a=$C; a <= plus ; a++))
do
touch "./expectedFiles/Fatma"$a
done