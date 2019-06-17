def transpose
    new_array = []
    (0...self.length).each do |row|
        new_row = []
        (0...self.length).each do |col|
        new_row  <<  self[col][row]
        end
    end
    new_array
end