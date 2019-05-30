class Bootcamp

  attr_reader :name, :slogan, :teachers, :students, :enroll
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = []  }
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        return true if students << student if students.length < @student_capacity
        return false
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        @grades[student].length
    end
    
    def average_grade(student)
        return nil if enrolled?(student) == false || num_grades(student) == 0

        (@grades[student].sum) / num_grades(student)
    end
end
