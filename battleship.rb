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
        cellz = self.cells
        # puts "This is cellz: #{cellz}"
        counter = 0
        newarray = []
        cellz.each do |cell|
            newcoord = coords
          
            if direction == "Horizontal"
                # puts "This is newcoord horizontal: #{newcoord}"
                newarray << [newcoord[0] + counter, newcoord[1]]
            elsif direction == "Vertical"
                # puts "This is newcoord vertical: #{newcoord}"
                newarray << [newcoord[0],newcoord[1] + counter] 
            end
            # puts "This is newarray after loop #{newarray}"
            # puts "This is new coords #{newcoord} for: #{cell}"
            # puts "This is the coords that were input #{coords}"
            count = 0
            newarray.each do |element|
                cellz[count][2] = element
                count += 1
            end    
            # puts "This is newarray #{newarray}"
            # puts "this is cellz now: #{cellz}"
            counter += 1
        end
        # puts "This is cellz after the loop: #{cellz}"
        self.cells = cellz
        map = self.board.cells
        puts "This is map #{map}"
        
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
            xcoords = (0..11).to_a
            ycoords = (0..11).to_a
        elsif size == "Medium"
            xcoords = (0..23).to_a
            ycoords = (0..23).to_a
        elsif size == "Large"
            xcoords = (0..35).to_a
            ycoords = (0..35).to_a
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