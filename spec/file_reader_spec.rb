require_relative '../file_reader.rb'

RSpec.describe FileReader do
  it 'reads an example file correctly' do
    pizza = FileReader.new('./input_sets/example.in').pizza
    expect(pizza.rows).to eq 3
    expect(pizza.columns).to eq 5
    expect(pizza.min_ingredients).to eq 1
    expect(pizza.max_slice_size).to eq 6
    expect(pizza.grid).to eq [
                ['T','T','T','T','T'],
                ['T','M','M','M','T'],
                ['T','T','T','T','T']
            ]
  end
end