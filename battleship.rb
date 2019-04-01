class Ship
    attr_reader :board
    attr_reader :size
    attr_accessor :cells
    def initialize(board, size)
        @board = board
        @size = size
        cells = []
        size.times do |number|
            cell = []
            cell << number
            cell << "intact"
            cell << "Location Not Set"
            cells << cell
        end
        @cells = cells
    end
    def setlocation(coords, direction)
        cells = self.cells
        cells.each do |cell|
            cell[2] = coords
            if direction == "diagonal"
                direction[1] = direction[1] + 1
            end
            if direction == "horizontal"
                direction[0] += 1
            end
        end
    end
end
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
            xcoords = (1..36).to_a
            ycoords = (1..36).to_a
        end
        cells = []
        xcoords.each do |value|
            value = value.digits(100)
            ycoords.each do |valuey|
                value << valuey
                value2 = []
                value2 << value
                value2 << "Empty"
                cells << value2
                value = value[0].digits(100)
            end
        end
        @cells = cells
    end
end