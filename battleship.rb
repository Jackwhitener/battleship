class Ship
    attr_reader :board
    attr_reader :size
    attr_reader :name
    attr_accessor :status
    attr_accessor :cells
    def initialize(board, size)
        @board = board
        @size = size
        @name = self
        @status = "Intact"
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
        amountfound = self.board.setlocations(self.cells, self)
        if amountfound != self.size
            return "NO"
        else
            return "COORDINATES SET"
            self.cells = cellz
            self.board.ships << self
        end
    end
    def destroy(coords)
        self.cells.each do |cell|
            if cell[2] == coords
                if cells.include?(["intact"])
                    self.status = "Damaged"
                else
                    self.status = "Destroyed"
                end
                cell[1] = "destroyed"
            end
            
        end

    end
end
class Board
    attr_accessor :size
    attr_accessor :cells
    attr_accessor :ships
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
        @ships = []
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
    def setlocations(shipcells, ship)
        mecells = self.cells
        foundcells = 0
        # puts "This is mecells #{mecells}"
        shipcells.each do |shipcell|
            # puts "This is shipcell: #{shipcell}"
            mecells.each do |mecell|
                # puts "This is shipcell #{shipcell}"
                # puts "This is mecell #{mecell}"
                # puts "This is shipcell position 2 #{shipcell[2]}"
                if shipcell[2] == mecell[0]
                    foundcells += 1
                    # puts "Match found!"
                    mecell[1] = ["Contains:", ship.name, shipcell[0]]
                end
            end
        end
        return foundcells
    end
    def hit(coords)
        self.cells.each do |cell|
            # puts "Current cell: #{cell}"
            if coords == cell[0] && cell[1].include?("Contains:")
                cell[1][1].destroy(coords)
                return "Target Destroyed"
            else
                return "Target Not Found"
            end
        end
    end
end