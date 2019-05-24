def sum_to(n)
    return 1 if n == 1
    return nil if n < 1

    n + sum_to(n-1)
end

def add_numbers(array)

    return array.join.to_i if array.length == 1
    return nil if array.empty?

    add_numbers(array[1..-1]) + array[0]
end

def gamma_function(n)
    return nil if n == 0
    return 1 if n == 1
    return 1 if n == 2

    gamma_function(n - 1) * (n - 1)
end

def ice_cream_shop(flavors, favorite)

    return false if flavors.empty?
    return true if flavors[0] == favorite

    ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)

    return string if string.length <= 1

    reverse(string[1..-1]) + string[0]
end