require_relative '../file_reader.rb'
require_relative '../pizza_painter.rb'
require_relative '../splitter_algorithm.rb'

RSpec.describe SplitterAlgorithm do
  it 'runs' do
    pizza = FileReader.new('./input_sets/small.in').pizza
    solver = SplitterAlgorithm.new(pizza)

    solution = solver.solve

    painter = PizzaPainter.new(pizza, solution.slices)
    painter.create_png('images/grenerated_by_splitter.png')
  end
end
