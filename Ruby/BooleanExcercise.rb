#1.
    num1=1
    num2=1
    num3=1

    diff1 = num1-num2
    diff2 = num2-num3
    p "same" if (diff1).abs == (diff2).abs
    p "diff" if (diff1).abs != (diff2).abs

#2.
def diff1Check(a,b,c)
    diff1 = a-b
    diff2 = b-c
    if(!(diff1.abs > 2)&& !(diff2.abs > 2) )
        return false
    else
        if(!(diff1.abs <= 1) && !(diff2.abs <= 1))
            return false
        else
            return true
        end
    end
end

p diff1Check(1,2,7)

#3
def checkDigits(fst,sec)
    strFst = fst.to_s
    strSec = sec.to_s
    if(strFst[0] == strSec[0] || strFst[0] == strSec[1])
        return true
    end
    if(strFst[1] == strSec[0] || strFst[1] == strSec[1])
        return true
    end
    return false
end

p checkDigits(91,81)


#4.
def diffCheck(fst,sec)
    if(fst == 11 || sec == 11 || (fst-sec).abs == 11 || (fst+sec) == 11)
        return true
    end
    return false
end

p diffCheck(10,1)


#5.
def checkeven(fst,sec)
    if(fst.include?("x") || sec.include?("x"))
        return false
    end
    if(fst[0] == fst[-1])
        return false
    end
    if(sec[0] == sec[-1])
        return false
    end
    return true
end

p checkeven("sqes","saa")


#6.

   
   check=("www").split("").intersection(["a","e","i","o","u","y"]).size > 0 
   if(check)
    p "vowel"
   else 
    p " not vowel"
   end

#7.
def scoreRange(score)
    if(score >= 0 || score < 50)
        return "fail"
    end
    if(score >= 50 || score < 60)
        return "pass"
    end
    if(score >= 60 || score < 70)
        return "good"
    end
    if(score >= 70 || score < 80)
        return "very good"
    end
    if(score >= 80 || score < 90)
        return "excellent"
    end
    if(score >= 90 || score <= 100)
        return "incredible"
    end
    return -1
end

p scoreRange(60)