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
        eplacerange = (0..11)
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
        eplacerange = (0..23)
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
        eplacerange = (0..35)
        set = true
    else
        puts "Invalid input, try again!"
    end
end
playerwins = false
computerwins = false
destroyerplaced = false
until destroyerplaced == true
    player.display
puts "Where do you want to place your destroyer on the x-axis? (right-to-left)"
destroyerxcoord = gets.chomp
puts "Where do you want to place your destroyer on the y-axis? (up-to-down)"
destroyerycoord = gets.chomp
puts "Would you like your destroyer to go horizontally, or vertically?(Valid answers: Horizontal, Vertical)"
destroyerdirection = gets.chomp
# puts "This is xcoord: #{xcoord}"
# puts "This is ycoord: #{ycoord}"
# puts "This is direction: #{direction}"
set = destroyer.setlocation([destroyerxcoord.to_i, destroyerycoord.to_i], destroyerdirection)


if set == "COORDINATES SET"
    puts "Destroyer placed!"
    destroyerplaced = true
    player.display
else
    puts "Something went wrong, try again!"
end
end

submarineplaced = false
until submarineplaced == true
    player.display
puts "Where do you want to place your submarine on the x-axis? (right-to-left)"
submarinexcoord = gets.chomp
puts "Where do you want to place your submarine on the y-axis? (up-to-down)"
submarineycoord = gets.chomp
puts "Would you like your submarine to go horizontally, or vertically?(Valid answers: Horizontal, Vertical)"
submarinedirection = gets.chomp
# puts "This is xcoord: #{xcoord}"
# puts "This is ycoord: #{ycoord}"
# puts "This is direction: #{direction}"
set = submarine.setlocation([submarinexcoord.to_i, submarineycoord.to_i], submarinedirection)


if set == "COORDINATES SET"
    puts "Submarine placed!"
    submarineplaced = true
    player.display
else
    puts "Something went wrong, try again!"
    destroyer.setlocation([destroyerxcoord.to_i, destroyerycoord.to_i], destroyerdirection)
end
end

battleshipplaced = false
until battleshipplaced == true
    player.display
puts "Where do you want to place your battleship on the x-axis? (right-to-left)"
battleshipxcoord = gets.chomp
puts "Where do you want to place your battleship on the y-axis? (up-to-down)"
battleshipycoord = gets.chomp
puts "Would you like your battleship to go horizontally, or vertically?(Valid answers: Horizontal, Vertical)"
battleshipdirection = gets.chomp
# puts "This is xcoord: #{xcoord}"
# puts "This is ycoord: #{ycoord}"
# puts "This is direction: #{direction}"
set = battleship.setlocation([battleshipxcoord.to_i, battleshipycoord.to_i], battleshipdirection)


if set == "COORDINATES SET"
    puts "Battleship placed!"
    battleshipplaced = true
    player.display
else
    puts "Something went wrong, try again!"
    destroyer.setlocation([destroyerxcoord.to_i, destroyerycoord.to_i], destroyerdirection)
    submarine.setlocation([submarinexcoord.to_i, submarineycoord.to_i], submarinedirection)
end
end

carrierplaced = false
until carrierplaced == true
    player.display
puts "Where do you want to place your carrier on the x-axis? (right-to-left)"
carrierxcoord = gets.chomp
puts "Where do you want to place your carrier on the y-axis? (up-to-down)"
carrierycoord = gets.chomp
puts "Would you like your carrier to go horizontally, or vertically?(Valid answers: Horizontal, Vertical)"
carrierdirection = gets.chomp
# puts "This is xcoord: #{xcoord}"
# puts "This is ycoord: #{ycoord}"
# puts "This is direction: #{direction}"
set = carrier.setlocation([carrierxcoord.to_i, carrierycoord.to_i], carrierdirection)


if set == "COORDINATES SET"
    puts "Carrier placed!"
    carrierplaced = true
    player.display
else
    puts "Something went wrong, try again!"
    destroyer.setlocation([destroyerxcoord.to_i, destroyerycoord.to_i], destroyerdirection)
    submarine.setlocation([submarinexcoord.to_i, submarineycoord.to_i], submarinedirection)
    battleship.setlocation([battleshipxcoord.to_i, battleshipycoord.to_i], battleshipdirection)
end
end

edestroyerplaced = false
until edestroyerplaced == true
    puts "...Placing Enemy Destroyer..."
    dxcoord = eplacerange.to_a.sample
    dycoord = eplacerange.to_a.sample
    ddirection = ["Horizontal", "Vertical"].sample
set = edestroyer.setlocation([dxcoord.to_i, dycoord.to_i], ddirection)
if set == "COORDINATES SET"
    edestroyerplaced = true
    puts "...Enemy Destroyer Placed..."
end
end

ebattleshipplaced = false
until ebattleshipplaced == true
    puts "...Placing Enemy Battleship..."
    bxcoord = eplacerange.to_a.sample
    bycoord = eplacerange.to_a.sample
   bdirection = ["Horizontal", "Vertical"].sample
set = ebattleship.setlocation([bxcoord.to_i, bycoord.to_i], bdirection)
if set == "COORDINATES SET"
    ebattleshipplaced = true
    puts "...Enemy Battleship Placed..."
else
    edestroyer.setlocation([dxcoord.to_i, dycoord.to_i], ddirection)
end
end

esubmarineplaced = false
until esubmarineplaced == true
    puts "...Placing Enemy Submarine..."
    sxcoord = eplacerange.to_a.sample
    sycoord = eplacerange.to_a.sample
    sdirection = ["Horizontal", "Vertical"].sample
set = esubmarine.setlocation([sxcoord.to_i, sycoord.to_i], sdirection)
if set == "COORDINATES SET"
    esubmarineplaced = true
    puts "...Enemy Submarine Placed..."
else
    edestroyer.setlocation([dxcoord.to_i, dycoord.to_i], ddirection)
    ebattleship.setlocation([bxcoord.to_i, bycoord.to_i], bdirection)
end
end

ecarrierplaced = false
until ecarrierplaced == true
    puts "...Placing Enemy Carrier..."
    cxcoord = eplacerange.to_a.sample
    cycoord = eplacerange.to_a.sample
    cdirection = ["Horizontal", "Vertical"].sample
set = ecarrier.setlocation([cxcoord.to_i, cycoord.to_i], cdirection)
if set == "COORDINATES SET"
    ecarrierplaced = true
    puts "...Enemy Carrier Placed..."
else
    edestroyer.setlocation([dxcoord.to_i, dycoord.to_i], ddirection)
    ebattleship.setlocation([bxcoord.to_i, bycoord.to_i], bdirection)
    esubmarine.setlocation([sxcoord.to_i, sycoord.to_i], sdirection)
end
end
computer.hide
computerxcoords = eplacerange.to_a
computerycoords = eplacerange.to_a
until (destroyer.status == "Destroyed" && submarine.status == "Destroyed" && battleship.status == "Destroyed" && carrier.status == "Destroyed") || (edestroyer.status == "Destroyed" && esubmarine.status == "Destroyed" && ebattleship.status == "Destroyed" && ecarrier.status == "Destroyed")
    puts "ENEMY RADAR"
    computer.display
    puts "FRIENDLY RADAR"
    player.display
    puts "Enter Target X Coordinate"
    xtarget = gets.chomp
    puts "Enter Target Y Coordinate"
    ytarget = gets.chomp
    didithit = computer.hit([xtarget.to_i, ytarget.to_i])
    puts "Result:"
    computer.display
    # puts didithit
    puts "The computer aims for..."
    ctarget = [computerxcoords.sample, computerycoords.sample]
    puts "(#{ctarget[0]}, #{ctarget[1]})!"
    player.hit(ctarget)
    puts "Result:"
    player.display
end
puts "GAME END"
if destroyer.status == "Destroyed" && submarine.status == "Destroyed" && battleship.status == "Destroyed" && carrier.status == "Destroyed"
    puts "COMPUTER WIN"
elsif edestroyer.status == "Destroyed" && esubmarine.status == "Destroyed" && ebattleship.status == "Destroyed" && ecarrier.status == "Destroyed"
    puts "PLAYER WIN"
end