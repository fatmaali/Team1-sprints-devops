#1.
def strStartCheck(str)
    
    if(str.start_with?("wel")||str.start_with?("to")||str.start_with?("zzz"))
        return true
    end
    return false
end

p strStartCheck(:tooooo)

#2.
def strEndCheck(str)
    
    if(str.end_with?("by") ||str.end_with?("zy") )
        return true
    end
    return false
end
p strEndCheck(:by)
#3
def symGetLength(sym)
    
     return sym.to_s.gsub(/[!@%&"]/,'').length
end
p symGetLength(:by)
#4
:sRs
p :sRs.to_s.upcase.intern
p :sRs
#5
:sRs.to_s
:sRs.intern
#6
resArr=:welcome_to_ruby.to_s.split("").map{|x| x.intern }
p resArr
