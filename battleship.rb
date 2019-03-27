class Board
    attr_accessor :size
    attr_accessor :cells
    def initialize(size)
        if size == "Small"
            @size = 12
        elsif size == "Medium"
            @size = 24
        elsif size == "Large"
            @size = 36
        end

        if size == "Small"
            xcoords = (1..12).to_a
            ycoords = (1..12).to_a
        elsif size == "Medium"
            xcoords = (1..24).to_a
            ycoords = (1..24).to_a
        elsif size == "Large"
            xcoords = (1..24).to_a
            ycoords = (1..24).to_a
        end
        cells = []
        xcoords.each_with_index do |value, index|
            value = value.digits(100)
            value << ycoords[index]
            cells << value
        end
        ycoords.each_with_index do |value, index|
            value = value.digits(100)
            value << xcoords[index]
            cells << value
        end
        @cells = cells
    end
end