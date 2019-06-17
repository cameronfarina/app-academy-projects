require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        end
        false
    end

    def >(startup)
       return true if self.funding > startup.funding

       false
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else  
            raise "error"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
      if @funding > @salaries[employee.title]
        employee.pay(@salaries[employee.title])
        @funding -= @salaries[employee.title]
      else  
        raise "not enough funding"
      end
    end

    def payday
        employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        salary = 0
        @employees.each do |employee|
            salary += @salaries[employee.title]
        end
        salary / @employees.length
    end
    
    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each do |title, salary|
            if @salaries.has_key?(title) == false
                @salaries[title] = salary
            end
        end

        @employees += startup_2.employees
        startup_2.close
    end


end
