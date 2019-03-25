class Board
    attr_accessor :size
    def initialize(size)
        if size == "Small"
            @size = 12
        elsif size == "Medium"
            @size = 24
        end
    end
end