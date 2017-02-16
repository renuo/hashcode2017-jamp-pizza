require_relative '../slice.rb'

RSpec::Matchers.define :overlap do |expected|
  match do |actual|
    expected.overlaps?(actual)
  end
end

RSpec.describe Slice do
  def 🍕(*coords)
    Slice.from_coordinates(*coords)
  end

  describe '#overlaps?' do
    it 'detects overlapping slice' do
      expect(🍕(0, 0, 2, 2)).to overlap(🍕(1, 1, 3, 3))
    end

    it 'detects overlapping slice if being contained' do
      expect(🍕(1, 1, 2, 2)).to overlap(🍕(0, 0, 3, 3))
    end

    it 'detects if slices use the same border cells' do
      expect(🍕(1, 1, 2, 2)).to overlap(🍕(2, 2, 3, 3))
    end

    it 'doesnt false positive' do
      expect(🍕(0, 0, 2, 2)).not_to overlap(🍕(3, 3, 4, 4))
    end
  end

  it 'can join another slice' do
    slice1 = 🍕(0, 0, 1, 1)
    slice2 = 🍕(0, 2, 1, 2)
    expect(slice1.join!(slice2).to_s).to eq '0 0 1 2'
  end

  it 'counts the size of a slice' do
    expect(🍕(0, 0, 1, 1).size).to eq 4
    expect(🍕(0, 0, 0, 0).size).to eq 1
    expect(🍕(0, 1, 0, 2).size).to eq 2
    expect(🍕(0, 0, 2, 2).size).to eq 9
  end
end
