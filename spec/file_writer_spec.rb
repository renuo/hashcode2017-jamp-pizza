require_relative '../file_writer.rb'
require_relative '../solution.rb'
require_relative '../slice.rb'

RSpec.describe FileWriter do
  it 'writes a solution correctly' do
    solution = Solution.new
    solution.slices << Slice.from_coordinates(0,0,2,1)
    solution.slices << Slice.from_coordinates(0,2,2,2)
    solution.slices << Slice.from_coordinates(0,3,2,4)
    FileWriter.new(solution, 'output_sets/example.out').write_out
  end
end