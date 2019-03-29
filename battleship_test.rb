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
        assert_equal([[1,1] ,"Empty"], (gameboard.cells[0]))
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
        ship = Ship.new(gameboard, 1)
        assert_equal([0,"intact", [0,0]], ship.setlocation(0,0))
    end
end