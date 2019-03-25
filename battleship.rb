class Board
    attr_accessor :size
    def initialize(size)
        if size == "Small"
            @size = 12
        end
    end
end