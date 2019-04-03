require "minitest/autorun"
require_relative "battleship.rb"
class Test < Minitest::Test
    def test1
        assert_equal(1,1)
    end
    def test_board_class
        gameboard = Board.new("Small")
        assert_equal(Board, gameboard.class)
    end
    def test_board_size
        gameboard = Board.new("Small")
        assert_equal(12, gameboard.size)
        gameboard1 = Board.new("Medium")
        assert_equal(24, gameboard1.size)
        gameboard2 = Board.new("Large")
        assert_equal(36, gameboard2.size)
    end
    def test_board_unit
        gameboard = Board.new("Small")
        assert_equal(144, gameboard.cells.count)
    end
    def test_indi_cell
        gameboard = Board.new("Small")
        assert_equal([[0,0] ,"Empty"], (gameboard.cells[0]))
    end
    def test_ship_class
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        assert_equal(Ship, ship.class)
    end
    def test_ship_size
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        assert_equal(2, ship.size)
    end
    def test_ship_cells
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        assert_equal([0,"intact","Location Not Set"], ship.cells[0])
    end
    def test_ship_location
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        ship.setlocation([0,0], "Vertical")
        assert_equal([0,"intact", [0,0]], ship.cells[0])
        assert_equal([1,"intact", [0,1]], ship.cells[1])
    end
    def test_ship_long_location
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 5)
        ship.setlocation([0,0], "Horizontal")
        assert_equal([0,"intact", [0,0]], ship.cells[0])
        assert_equal([1,"intact", [1,0]], ship.cells[1])
    end
    def test_ship_coords_map_writing
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        ship.setlocation([0,0], "Vertical")
        assert_equal([[0,0] ,"Contains: #{ship.name}, 0"], gameboard.cells[0])
    end
    def test_hit_location_valid
        gameboard = Board.new("Small")
        ship = Ship.new(gameboard, 2)
        ship.setlocation([0,0], "Vertical")
        assert_equal("Target Destroyed", gameboard.hit([0,0]))
    end
end