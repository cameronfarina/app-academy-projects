#require "byebug"

def reverser(number)

    return [number] if number < 10
    
    remainder = (number % 10)
    beginning_numbers = (number / 10)
    
    results = ([remainder].push([reverser(beginning_numbers)]))
    
end

def reverser(number, finished=true)
    # debugger
    return [number] if number < 10
    
    remainder = (number % 10)
    beginning_numbers = (number / 10)
     
    if finished
      [remainder].concat(reverser(beginning_numbers, finished=false)).join("").to_i
    else  
      [remainder].concat(reverser(beginning_numbers, finished=false))
    end 

end

p reverser(1234) # 4321
# p reverser(1001)  # 11
# p reverser(1010)  # 11 