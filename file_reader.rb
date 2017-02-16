require_relative 'pizza.rb'

class FileReader
    
    def initialize(file_path)
        @file = File.read(file_path)
        @lines = @file.split(/\n/)
        @first_line = @lines[0].split
        @grid = @lines[1..-1]
    end
    
    def pizza
        @pizza ||= Pizza.new.tap do |pizza|
            pizza.rows = @first_line[0].to_i
            pizza.columns = @first_line[1].to_i
            pizza.min_ingredients = @first_line[2].to_i
            pizza.max_slice_size = @first_line[3].to_i
            pizza.grid = @grid.map do |row|
                row.split('')
            end
        end
    end
end