class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, 
        self.boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee

    attr_reader :employees 

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        my_bonus = 0
        employees.each do |employee|
           my_bonus += employee.salary
        end
        my_bonus * multiplier
    end

    def add_employee(subordinate)
        self.employees << subordinate
        self.employees
    end
    
end