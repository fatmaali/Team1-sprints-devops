
#----------------------------------------Loop Exercise------------------------------------------------
#1.
loopArr=[1,2,3,4,5,6,7,8,9,10]
for j in loopArr do
    p j
  end
#2.
for j in loopArr do
    if(j==5||j==6)
     next
     else
        p j
    end
  end
#3.
for j in loopArr do
    if(j<6)
        p j
    end
  end
#4.
for j in loopArr do
    if(j%2==0)
        p j
    end
  end

#5.
for j in loopArr do
    if(j%2!=0)
        p j
    end
  end

#6.
for j in 2..9 do
        p j   
  end

#7.
for j in loopArr do
    if(j%2!=0)
        p j.to_s + ' Odd'
    else
        p j.to_s+' even'
    end
  end
