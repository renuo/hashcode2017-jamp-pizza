class Solution
    attr_accessor :slices

    def initialize(slices = [])
        @slices = slices
    end

    def has_overlaps?
        @slices.any? do |slice| # O(n^2) kind of good
            @slices.any? do |other_slice|
                slice.overlaps?(other_slice)
            end
        end
    end
end