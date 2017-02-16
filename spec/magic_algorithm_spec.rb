require_relative '../file_reader.rb'
require_relative '../magic_algorithm.rb'

RSpec.describe MagicAlgorithm do
  let(:file_path) { 'input_sets/example.in'}
  let(:pizza) {FileReader.new(file_path).pizza}
  let(:algorithm) { MagicAlgorithm.new(pizza)}
  it 'returns the next slice for a pizza' do
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '0 0 0 0'
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '0 1 0 1'
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '0 2 0 2'
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '0 3 0 3'
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '0 4 0 4'
    next_slice = algorithm.next_slice
    expect(next_slice.to_s).to eq '1 0 1 0'
  end

  it 'calculates adjacent right' do
    expect(algorithm.adjacent_right(Slice.from_coordinates(0,0,0,0)).to_s).to eq '0 1 0 1'
    expect(algorithm.adjacent_right(Slice.from_coordinates(0,0,1,1)).to_s).to eq '0 2 1 2'
    expect(algorithm.adjacent_right(Slice.from_coordinates(0,1,1,2)).to_s).to eq '0 3 1 3'
    expect(algorithm.adjacent_right(Slice.from_coordinates(0,0,0,4))).to be_nil
  end

  it 'calculates adjacent bottom' do
    expect(algorithm.adjacent_bottom(Slice.from_coordinates(0,0,0,0)).to_s).to eq '1 0 1 0'
    expect(algorithm.adjacent_bottom(Slice.from_coordinates(0,0,1,1)).to_s).to eq '2 0 2 1'
    expect(algorithm.adjacent_bottom(Slice.from_coordinates(0,1,1,2)).to_s).to eq '2 1 2 2'
    expect(algorithm.adjacent_bottom(Slice.from_coordinates(0,0,2,0))).to be_nil
    expect(algorithm.adjacent_bottom(Slice.from_coordinates(0,0,2,2))).to be_nil
  end

  it 'increases the slice for a pizza' do
    slice = algorithm.next_slice
    expect(slice.to_s).to eq '0 0 0 0'
    # algorithm.increase
    # expect(slice.to_s).to eq '0 0 0 1'
    # next_slice = algorithm.next_slice
    # expect(next_slice.to_s).to eq '0 2 0 2'
    # next_slice = algorithm.next_slice
    # expect(next_slice.to_s).to eq '0 3 0 3'
    # next_slice = algorithm.next_slice
    # expect(next_slice.to_s).to eq '0 4 0 4'
    # next_slice = algorithm.next_slice
    # expect(next_slice.to_s).to eq '1 0 1 0'
  end
end
