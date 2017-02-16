require_relative './slice.rb'
require_relative './solution.rb'

class SplitterAlgorithm
    def initialize(pizza)
        @pizza = pizza
        @slices = []
        @bad_slices = nil
        @slice_width = nil
        @slice_height = nil
    end

    def solve
        calculate_slice_dimension
        create_all_slices
        select_good_slices
        Solution.new(@slices)
    end

    def select_good_slices
        @slices.select! { |slice| valid_slice?(slice) }
    end

    def valid_slice?(slice)
        slice_ys = slice.point_top_left.y..slice.point_bottom_right.y
        slice_xs = slice.point_top_left.x..slice.point_bottom_right.x

        ingedients = slice_ys.map do |y|
            slice_xs.map { |x| @pizza.grid[y][x] }
        end.flatten

        tomato_count = ingedients.count { |item| item == 'T' }
        mushroom_count = ingedients.count { |item| item == 'M' }

        (tomato_count >= @pizza.min_ingredients) && (mushroom_count >= @pizza.min_ingredients)
    end

    def create_all_slices
        @slices = (0..@pizza.rows - @slice_height).step(@slice_height).map do |slice_y|
            (0..@pizza.columns - @slice_width).step(@slice_width).map do |slice_x|
                Slice.from_coordinates(slice_y, slice_x, slice_y + @slice_height - 1, slice_x + @slice_width - 1)
            end
        end.flatten
    end

    def calculate_slice_dimension
        @slice_width = 1
        @slice_height = 1

        while valid_slice_size? do
            @slice_width += 1
            @slice_height += 1
        end

        @slice_width -= 1 unless valid_slice_size?
        @slice_height -= 1 unless valid_slice_size?
    end

    def valid_slice_size?
        (@slice_width * @slice_height) <= @pizza.max_slice_size
    end
end