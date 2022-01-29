#1.
number = 1

binNum = Integer(number.to_s,2)

p binNum
#2.
evenOddFlag = "odd" if number.odd?
evenOddFlag = "even" if number.even?

p evenOddFlag

#3.
subtracted2 = number - 2

p subtracted2
#4.
devidedby2 = subtracted2.to_f
devidedby2 = devidedby2/2

p devidedby2
#5.
quart = Rational(1)/4

rat = quart

ratAdd = Rational(devidedby2 + rat)

p ratAdd
#6.
p ratAdd.numerator
p ratAdd.denominator

third = Rational(1)/3
#7.
multipliedByThird = third * ratAdd

p multipliedByThird
#8.
roundedTo3 = multipliedByThird.to_f.round(3)

p roundedTo3
#9.
y = roundedTo3.to_s

p y
#10.
intY = y.to_i

p intY
#11.
decY = y.to_i(base=10)

p decY