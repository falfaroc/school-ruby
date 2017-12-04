class BeanCounting
    @guesses = Hash.new(Hash.new)

    def initialize(input)
        @input = input 
        @beans = 'aadddddddddddddddddddddddffffffffffffffffwwwwwwwwwwwwccccalalala'
        string_count()
        string_split()
    end

    def string_count()
        puts  ("Number of a's: " + @beans.count('a').to_s + " d's: " + @beans.count('d').to_s + " f's: " + @beans.count('f').to_s + " w's: " + @beans.count('w').to_s + " c's: " + @beans.count('c').to_s + " l's: " + @beans.count('l').to_s)
    end

    def string_split()
        testing = "A a:6,c:6\nB w:12\nC d:25\nD d:22,c:4,l:3,f:15\n"
        arr_input = @input.split('\n')
        # arr_input = @input.lines.map(&:chomp)
        for i in 0..arr_input.count-1 do
            puts(arr_input[i][0])
        end
        puts(arr_input[0][0])
    end

    def message_count()

    end
end