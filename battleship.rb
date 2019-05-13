class Ship
    attr_reader :board
    attr_reader :size
    attr_reader :name
    attr_accessor :status
    attr_accessor :cells
    attr_accessor :direction

    def initialize(board, size)
        @board = board
        @size = size
        @name = self
        @status = "Intact"
        @direction = "Not Set"
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
        @direction = direction
        
        cellz = self.cells
        # puts "This is cellz: #{cellz}"
        # puts "This is direction: #{direction.class}"
        counter = 0
        newarray = []
        cellz.each do |cell|
            newcoord = coords.reverse
            if direction == "Vertical"
                # puts "This is newcoord horizontal: #{newcoord}"
                newarray << [newcoord[0] + counter, newcoord[1]]
            elsif direction == "Horizontal"
                # puts "This is newcoord vertical: #{newcoord}"
                newarray << [newcoord[0],newcoord[1] + counter]
            else
                puts "He's dead, Jim." 
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
        amountfound = self.board.setlocations(self.cells, self, self.direction)
        # puts "This is amountfound: #{amountfound}"
        # puts "This is the self.size: #{self.size}"
        if amountfound != self.size
            return "Placement Failed"
        elsif amountfound == 0
            return "Placement Failed"
        elsif amountfound == "COORDINATES NOT SET"
            return "Placement Failed"
        else
            return "COORDINATES SET"
            self.cells = cellz
            self.board.ships << self
        end
    end
    def destroy(coords)
        counter = 0
        self.cells.each do |cell|
            if cell[2] == coords
                # puts "This is cell: #{cell}"
                cell[1] = "destroyed"
            end
            if cell.include?("destroyed")
                counter += 1
            end
        end
        if counter == self.size
            self.status = "Destroyed"
        else
            self.status = "Damaged"
        end
    end
end
class Board
    attr_accessor :size
    attr_accessor :cells
    attr_accessor :ships
    attr_accessor :hidden
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
        @hidden = false
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
    def setlocations(shipcells, ship, direction)
        mecells = self.cells
        cellarray = []
        shipcells.each do |cell|
            # puts "This is a cell: #{cell}"
              if direction == "Vertical"
                 cellarray << cell[2][1]
             elsif direction == "Horizontal"
                 cellarray << cell[2][0]
             end
            cellarray.uniq!
        end 
        # puts "This is cellarray #{cellarray}"
        foundcells = 0
        # puts "This is mecells #{mecells}"
        shipcells.each do |shipcell|
            # puts "This is shipcell: #{shipcell}"
            mecells.each do |mecell|
                # puts "This is shipcell #{shipcell}"
                # puts "This is mecell #{mecell}"
                # puts "This is shipcell position 2 #{shipcell[2]}"
                if shipcell[2] == mecell[0]
                    # puts "This is MECELL: #{mecell}"
                    # puts "This is mecell[1][0]: #{mecell[1][0]}"
                    if mecell[1][0] == "Contains:"
                        # foundcells = "OCCUPIED"
                    elsif mecell[1][0] != "Contains:"
                        foundcells += 1
                        # puts "Match found!"
                        mecell[1] = ["Contains:", ship.name, shipcell[0]]
                    end
                end
            end
        end
        if cellarray.length != 1
            mecells.each do |shipcells|
                # puts "This is shipcell: #{shipcells}"
                    if shipcells[1] != "Empty" 
                        # puts "Cell emptied"
                        shipcells[1] = "Empty"
                    end
                # puts "This should be an empty shipcell: #{shipcells}"
            end
            return "COORDINATES NOT SET"
        elsif foundcells != ship.size
            # puts "This is foundcells: #{foundcells}"
            # puts "This is ship.size: #{ship.size}"
            mecells.each do |shipcells|
                # puts "This is shipcell: #{shipcells}"
                    if shipcells[1] != "Empty" 
                        # puts "Cell emptied"
                        shipcells[1] = "Empty"
                    end
                # puts "This should be an empty shipcell: #{shipcells}"
            end
            return "COORDINATES NOT SET"
        else
            return foundcells
        end
    end
    def hit(coords)
        coords.reverse!
        self.cells.each do |cell|
            # puts "Current coords #{coords}"
            # puts "Current cell: #{cell}"
            if coords == cell[0] && cell[1].include?("Contains:")
                cell[1][1].destroy(coords)
                cell.delete_at(2)
                return "Target Destroyed"
            elsif coords == cell[0] && false == cell[1].include?("Contains:")
                cell.delete_at(2)
                return "Target Not Found"
            end
        end
    end
    def hide
        self.cells.each do |cell|
            cell << "Hidden"
        end
    end
    def display
        puts " "
        displayarray = []
        if self.size == 12
            12.times do |number|
                arr = [] 
                12.times do |number1|
                    arr << self.cells[number1 + (number * 12)]

                end
                displayarray << arr
            end
        elsif self.size == 24
            24.times do
                arr = [] 
                24.times do |number1|
                    arr << self.cells[number1]

                end
                displayarray << arr
            end
        elsif self.size == 36
            36.times do
                arr = [] 
                36.times do |number|
                    arr << self.cells[number1]

                end
                displayarray << arr
            end
        end
        # puts "This is displayarray: #{displayarray}"
        print "    "
        displayarray.length.times do |num|
            print "("
            print num
            if num < 10
                print " "
            end
            print ")"
        end
        puts " "
        displaycounter = 0
        displayarray.each do |row|
            # puts "This is row #{row}"
            print "(#{displaycounter}"
            print " " if displaycounter < 10 
            print ")"
            row.each do |cell|
                # puts "This is cell: #{cell}"
                if cell.include?("Hidden")
                    print "(??)"
                else
                    # puts cell[1]
                    if cell[1][0] == "Contains:"
                        
                       print "(D" if cell[1][1].size == 2
                       print "(S" if cell[1][1].size == 3
                       print "(B" if cell[1][1].size == 4
                       print "(C" if cell[1][1].size == 5
                       print "I)" if cell[1][1].status == "Intact"
                       print "D)" if cell[1][1].status == "Damaged"
                       print "X)" if cell[1][1].status == "Destroyed"
                    else
                        print "(~~)"
                    end
                end
            end
            puts " "
            displaycounter += 1
        end
        puts " "
        return "Map Succesfully Displayed"
    end
end