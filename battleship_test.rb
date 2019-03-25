require "minitest/autorun"
require_relative "battleship.rb"
class Test < Minitest::Test
    def test1
        assert_equal(1,1)
    end
    def test_board_class
        gameboard = Board.new
        assert_equal(Board gameboard.class)
    end
end