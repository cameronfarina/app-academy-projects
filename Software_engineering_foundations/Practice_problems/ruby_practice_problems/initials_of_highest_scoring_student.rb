def highest_score(students)
    new_hash = {}

    students.each do |student|
        avg = student["scores"].sum / (student["scores"].length * 1.0)
        name = student["name"] 
        new_hash[name] = avg
    end

    max = 0
    name = ""

    new_hash.each do |student_name, avg|
        if avg > max
            max = avg
            name = student_name
        end
    end
    # puts new_hash
    # puts name
    return get_initials(name)
end

def get_initials(name)
    new_name = ""

    name.split.each do |el|
        new_name += el[0]
    end

    new_name
end



students_1 = [
    {"name"=>"Alvin Zablan", "scores"=>[-42, 20, 50]},
    {"name"=>"Eliot Bradshaw", "scores"=>[57, 100, 80]},
    {"name"=>"Tommy Duek", "scores"=>[90, 100]},
    {"name"=>"Fred Sladkey", "scores"=>[94, 92]}
]
p highest_score(students_1)     # => "TD"

students_2 = [
    {"name"=>"Rose Koron", "scores"=>[97, 90]},
    {"name"=>"Jeff Fiddler", "scores"=>[100, 90, 80]},
    {"name"=>"Dave Fort", "scores"=>[85, 96]},
    {"name"=>"Mary La Grange", "scores"=>[100]},
    {"name"=>"Candace Hsu", "scores"=>[89, 94]}
]
p highest_score(students_2)     # => "MLG"