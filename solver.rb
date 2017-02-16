#!/usr/bin/ruby

require_relative 'file_reader.rb'
require_relative 'file_writer.rb'
require_relative 'splitter_algorithm.rb'
require_relative 'magic_algorithm.rb'
require_relative 'working_algorithm.rb'
require_relative 'pizza_painter.rb'

# 1) Takes the file as input and the output is four variables and a 2d array
# 2) the algoritm where the magic happens algoritm(grid: string[][], rows, columns, min_ingredients, max_slice_size)
#  --> returns (number_of_slices, slice[])   slice: (point, point)
# 3) take the output and convert it into a text file
# 4) tests for 2)
#
# e.g. call it like that:
# ruby solver.rb medium SplitterAlgorithm
puts "hello! I'll cut your pizza today..."
input_file_name = ARGV[0] || 'small'
algorithm = Object.const_get(ARGV[1] || 'MagicAlgorithm')
file_path = "input_sets/#{input_file_name}.in"
output_path = "output_sets/#{input_file_name}.out"
pizza = FileReader.new(file_path).pizza
start_time = Time.now
solution = algorithm.new(pizza).solve
end_time = Time.now
FileWriter.new(solution, output_path).write_out
puts "I served your pizza slices in #{output_path}. It took me #{end_time - start_time} seconds"

painter = PizzaPainter.new(pizza, solution.slices)
painter.create_png("images/#{input_file_name}.png")