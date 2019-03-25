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
    end
end