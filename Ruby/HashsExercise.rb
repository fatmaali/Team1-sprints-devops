Employees = {
    10 => {name:"Ahmed",salary:1000},
    21 => {name:"Mohamed",salary:2000},
    113 => {name:"Mahmoud",salary:5000},
    4 => {name:"Yassin",salary:3000},
    52 => {name:"Taha",salary:4000},
    102 => {name:"Khadija",salary:nil},
    64 => {name:"Sara",salary:5000},
    37 => {name:"Nadine",salary:5000},
    88 => {name:"Doaa",salary:4000},
    90 => {name:"Iman",salary:4000},
    103 => {name:"Khadija",salary:1000},
    12 => {name:"Kholod",salary:nil},
    15 => {name:"Said",salary:nil},
    38 => {name:"Nadine",salary:5000},
    89 => {name:"Doaa",salary:4000},
    91 => {name:"Iman",salary:4000},
    104 => {name:"Khadija",salary:1000},
    17 => {name:"Kholod",salary:nil},
    14 => {name:"Said",salary:nil},
}

# 1.
def getEmpsName(emps)
    res = []

    emps.each do |key, value|
        res.push(value[:name])
    end

    return res
end

p getEmpsName(Employees)

# 2.
def getEmpsIds(emps)
    res = []
    emps.each do |key, value|
        res.push(key)
    end
    return res
end

p getEmpsIds(Employees)

#3.

def highestSalary(emps)
    res = []
    emps.each do |key, value|
        value[:id]= key
        if(value[:salary].nil?)
            value[:salary] = 0
        end
        res.push(value)
    end
    return res.sort_by { |emp| -emp[:salary] }
end

p highestSalary(Employees)

#4.

def sortSalaryAsc(emps)
    res = []
    emps.each do |key, value|
        value[:id]= key
        if(value[:salary].nil?)
            value[:salary] = 0
        end
        res.push(value)
    end
    res.sort_by { |emp| emp[:salary] }
end

p sortSalaryAsc(Employees)

#5.

def averageSalary(emps)
    sum = 0
    count = 0
    emps.each do |key, value|
        if(!value[:salary].nil?)
            sum += value[:salary]
        end
        count += 1
    end
    return sum.to_f/count
end

p averageSalary(Employees)


# 6.

def filterEmpty(emps)
    res = []
    emps.each do |key, value|
        value[:id]= key
        if(!value[:salary].nil?)
            res.push(value)
        end
    end
    return res
end

p filterEmpty(Employees)

# 7.

def filterDuplicate(emps)
    res = []

    uniqueNames = {}
    emps.each do |key, value|

        curName = value[:name]

        if(!uniqueNames.has_key?(curName))
            uniqueNames[curName] = true
            res.push(value)
        end
    end
    
    return res
end

p filterDuplicate(Employees)

#8.

def MaxOccurence(emps)

    maxEmp = nil
    max = 0
    uniqueNames = {}
    emps.each do |key, value|

        curName = value[:name]

        if(!uniqueNames.has_key?(curName))
            uniqueNames[curName] = 1 
        
        else
            uniqueNames[curName] += 1
        end

        if(max < uniqueNames[curName])
            max = uniqueNames[curName]
            maxEmp = value
        end
    end
    
    return maxEmp[:name]
end

p "Max Occurence emp is "+MaxOccurence(Employees)