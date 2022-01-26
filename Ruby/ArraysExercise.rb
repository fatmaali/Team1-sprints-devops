#----------------------------------------Arrays Exercise----------------------------------------------------------
#1.
arr=[1,2,3,4,5]
p arr.min
p arr.max
p arr.count
p arr.reduce { |prod, n| prod * n }
#2.
value=3
p arr.any?(value)
#3.
repeated_Arr=[1,1,2,2,3,3,3]
p repeated_Arr.uniq.map {|element| [element,repeated_Arr.count(element)]}
#4.
p arr.reduce { |sum, n| sum + n }
#5.
p repeated_Arr.uniq
#6.
new_arr=Array.new(2)
evenArr=[2,4,6,8]
len=evenArr.size
new_arr=[evenArr[(len/2)-1],evenArr[(len/2)]]
p new_arr
#7.
odd_length_arr=[5,9,2,3,0]
p odd_length_arr.max
#8.
def sumArr(arr)
    arrSize=arr.size
    if(arrSize==0)
        return 0
    end
    sum =arr[0]
    
    for i in 1..(arrSize-1) do
     
        if(arr[i]==17||arr[i-1]==17)
            next
        else
            sum=sum+arr[i]
        end
    end
    return sum
end

p sumArr(arr)
#9.

def identicalCheck(arr)
    uniqueArrLength=arr.uniq.size
    if(uniqueArrLength==1)
        return true
    end
    return false
end
idArr=[3,3,3,3,3,3]

p identicalCheck(idArr)

#10.
arr1 ='ABC'.each_char.to_a
arr2='DEF'.each_char.to_a