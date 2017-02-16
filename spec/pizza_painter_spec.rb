require_relative '../file_reader.rb'
require_relative '../slice.rb'
require_relative '../pizza_painter.rb'

RSpec.describe PizzaPainter do
  it 'draws a pizza with a cut pattern' do
    pizza = FileReader.new('./input_sets/small.in').pizza
    raw_slices = [
      [0, 0, 0, 2],
      [0, 3, 0, 6],
      [1, 0, 5, 0],
      [1, 1, 2, 2],
      [1, 3, 1, 6],
      [2, 3, 2, 6],
      [3, 1, 5, 1],
      [3, 2, 5, 2],
      [3, 3, 3, 6],
      [4, 3, 4, 6],
      [5, 3, 5, 6]
    ]

    slices = raw_slices.map { |coordinates| Slice.from_coordinates(*coordinates) }
    painter = described_class.new(pizza, slices)
    painter.create_png('images/generated_by_spec.png')
  end
end