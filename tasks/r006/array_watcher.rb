# Keeps track of custome arrays for efficiency
# calculations
class ArrayWatcher
    def initialize(arr)
        @array_watch = arr
        @array_count = 0
    end

    def length()
        @array_watch.count
    end

    def [](location)
        @array_count = @array_count + 1
        @array_watch[location]
    end

    def []=(location, value)
        @array_count = @array_count + 1
        @array_watch[location] = value
    end

    def get_count()
        @array_count
    end

    def get_array()
        @array_watch
    end
end