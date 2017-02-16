require 'chunky_png'

class PizzaPainter
    SCALE = 10
    SLICE_COLOR = ChunkyPNG::Color('yellow @ 0.2')
    TOMATO_COLOR = ChunkyPNG::Color(:tomato)
    MUSHROOM_COLOR = ChunkyPNG::Color(:brown)

    def initialize(pizza, slices)
        @pizza = pizza
        @slices = slices
    end

    def create_png(filepath)
        @png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::BLACK)
        draw_pizza
        draw_slices
        @png.save(filepath, interlace: true)
    end

    private

    def draw_pizza
        @pizza.grid.each_with_index do |row, y|
            row.each_with_index do |cell, x|
                color = ChunkyPNG::Color(:green) # init with error color
                color = TOMATO_COLOR if cell == 'T'
                color = MUSHROOM_COLOR if cell == 'M'

                @png.rect(x * SCALE, y * SCALE, x * SCALE + SCALE, y * SCALE + SCALE, color, color)
            end
        end
    end

    def draw_slices
        @slices.each do |slice|
            @png.rect(slice.point_top_left.x * SCALE,
                      slice.point_top_left.y * SCALE,
                      slice.point_bottom_right.x * SCALE + SCALE,
                      slice.point_bottom_right.y * SCALE + SCALE,
                      ChunkyPNG::Color::BLACK,
                      SLICE_COLOR)
        end
    end

    def height
        @pizza.rows * SCALE
    end

    def width
        @pizza.columns * SCALE
    end
end
