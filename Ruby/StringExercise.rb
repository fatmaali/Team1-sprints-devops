#----------------------------------Strings Exercise-------------------------------------------------
#1. Remove “Hello” , print the text
txt="Hello Ruby World"
p txt.sub("Hello ", '');
#2.Add “Welcome to” to the beginning, print the text
p  txt.sub('Hello',"Welcome to Hello");
#3.Replace “World” by your name, print the text
p txt.sub('World',"Fatma");
#4.Put your name between quotes , print the text
puts txt.sub('World','"Fatma"');
#5.ex:Welcome to Ruby “Ahmed”
p txt.sub('World',"Fatma");
#6.Insert a “,” after the word “Ruby”, print the text
p txt.sub("Ruby","Ruby,");
#7.Insert a tab after the coma, print the text
p txt.sub(",",",  ")
#8.Count the number of characters, print the count
p txt.length
#9.Count number of spaces, print the count
p txt.count(" ")
#10.Replace the text spaces by “-”, print the text
p txt.sub(" ","-")