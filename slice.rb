class Cell
    attr_accessor :column_index, :row_index

    def initialize(column_index, row_index)
        @column_index = column_index
        @row_index = row_index
    end

    def y
        row_index
    end

    def x
        column_index
    end
end

class Slice
    attr_accessor :point_top_left, :point_bottom_right, :ingredients

    def self.from_coordinates(tl_row_index, tl_column_index, br_row_index, br_column_index)
        Slice.new.tap do |slice|
            slice.point_top_left = Cell.new(tl_column_index, tl_row_index)
            slice.point_bottom_right = Cell.new(br_column_index, br_row_index)
        end
    end

    def to_s
        "#{point_top_left.row_index} #{point_top_left.column_index} #{point_bottom_right.row_index} #{point_bottom_right.column_index}"
    end

    def overlaps?(other)
        # If one rectangle is on left side of other
        if (point_top_left.x > other.point_bottom_right.x || other.point_top_left.x > point_bottom_right.x)
            return false
        end

        # If one rectangle is above other
        if (point_top_left.y > other.point_bottom_right.y || other.point_top_left.y > point_bottom_right.y)
            return false
        end

        return true
    end

    def include?(row_index, column_index)
        (point_top_left.column_index..point_bottom_right.column_index).include?(column_index) &&
        (point_top_left.row_index..point_bottom_right.row_index).include?(row_index)
    end


    def join!(slice)
        point_top_left.column_index = [point_top_left.column_index, slice.point_top_left.column_index].min
        point_top_left.row_index = [point_top_left.row_index, slice.point_top_left.row_index].min
        point_bottom_right.column_index = [point_bottom_right.column_index, slice.point_bottom_right.column_index].max
        point_bottom_right.row_index = [point_bottom_right.row_index, slice.point_bottom_right.row_index].max
        self
    end

    def size
        (point_bottom_right.column_index - point_top_left.column_index + 1) *
        (point_bottom_right.row_index - point_top_left.row_index + 1)
    end
end
