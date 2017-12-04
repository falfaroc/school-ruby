class BeanCounting
    def initialize(input)
        # @input = input 
        @guesses = Hash.new(Hash.new)
        @beans_count = Hash.new
        @beans = 'aadddddddddddddddddddddddffffffffffffffffwwwwwwwwwwwwccccalalala'
        string_count()
        string_split(input)
    end

    def string_count()
        ("a".."z").each { |letter| puts letter }
        puts  ("Number of a's: " + @beans.count('a').to_s + " d's: " + @beans.count('d').to_s + " f's: " + @beans.count('f').to_s + " w's: " + @beans.count('w').to_s + " c's: " + @beans.count('c').to_s + " l's: " + @beans.count('l').to_s)
    end

    def string_split(input)
        arr_input = input.split('\n')
        @num_of_contestants = arr_input.count

        for i in 0..@num_of_contestants-1 do
            loc = arr_input[i][0]
            arr_input[i][0..1] = ''

            arggg = arr_input[i].split(',')
            for rest in 0..arggg.count-1 do
                the_split = arggg[rest].partition(':')

                # puts("FIRST: " + the_split[0] + " REST: " + the_split[2])
                @guesses[loc][the_split[0]] = the_split[2]

            end
        end

        # @guesses["A"].key?("b") -- Check for key?
        puts ("HELLO: " + @guesses["A"].key?("b").to_s)
    end

    def message_count()

    end
end