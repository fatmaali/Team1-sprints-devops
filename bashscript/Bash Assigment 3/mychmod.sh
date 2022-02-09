X=$(ls -p /home/fatma|grep -v /)
for i in ${X}
do
echo $i
chmod +x  '/home/fatma'$i
done
