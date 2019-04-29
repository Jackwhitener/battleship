require_relative "battleship.rb"
set = false
while set == false
    puts "Input the desired map size, Small, Medium, or Large"
    size = gets.chomp
    if size == "Small" || size == "small" || size == "s"
        player = Board.new("Small")
        computer = Board.new("Small")
        destroyer = Ship.new(player, 2)
        submarine = Ship.new(player, 3)
        battleship = Ship.new(player, 4)
        carrier = Ship.new(player, 5)
        edestroyer = Ship.new(computer, 2)
        esubmarine = Ship.new(computer, 3)
        ebattleship = Ship.new(computer, 4)
        ecarrier = Ship.new(computer, 5)
        set = true
    elsif size == "Medium" || size == "medium" || size == "m"
        player = Board.new("Medium")
        computer = Board.new("Medium")
        computer = Board.new("Small")
        destroyer = Ship.new(player, 2)
        submarine = Ship.new(player, 3)
        battleship = Ship.new(player, 4)
        carrier = Ship.new(player, 5)
        edestroyer = Ship.new(computer, 2)
        esubmarine = Ship.new(computer, 3)
        ebattleship = Ship.new(computer, 4)
        ecarrier = Ship.new(computer, 5)
        set = true
    elsif size == "Large" || size == "large" || size == "l"
        player = Board.new("Large")
        computer = Board.new("Large")
        destroyer = Ship.new(player, 2)
        submarine = Ship.new(player, 3)
        battleship = Ship.new(player, 4)
        carrier = Ship.new(player, 5)
        edestroyer = Ship.new(computer, 2)
        esubmarine = Ship.new(computer, 3)
        ebattleship = Ship.new(computer, 4)
        ecarrier = Ship.new(computer, 5)
        set = true
    else
        puts "Invalid input, try again!"
    end
end
playerwins = false
computerwins = false
puts "Where do you want to place your destroyer on the x-axis? (right-to-left)"
xcoord = gets
puts "Where do you want to place your destroyer on the y-axis? (up-to-down)"
ycoord = gets
puts "Would you like your destroyer to go horizontally, or vertically?(Valid answers: Horizontal, Vertical)"
direction = gets
set = destroyer.setlocation([xcoord.to_i,ycoord.to_i], direction)
puts set
if set != "COORDINATES SET"
    puts "Something went wrong!"
end
# until playerwins == true || computerwins == true

# end