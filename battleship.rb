class Board
    attr_accessor :size
    def initialize(size)
        if size == "Small"
            @size = 12
        elsif size == "Medium"
            @size = 24
        elsif size == "Large"
            @size = 36
        end
    end
end