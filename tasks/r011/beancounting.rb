class BeanCounting
    def initialize(input)
        # @input = input 
        @guesses = Hash.new
        @beans_count = Hash.new
        @contestant_share = Hash.new
        @total_shares = 0
        @total_guesses = 0
        beans = 'aadddddddddddddddddddddddffffffffffffffffwwwwwwwwwwwwccccalalala'
        string_count(beans)
        string_split(input)
    end

    def string_count(beans)
        ('a'..'z').each { |letter| 
            @beans_count[letter] = beans.count(letter).to_s
        }
    end

    def string_split(input)
        arr_input = input.split('\n')

        for i in 0..arr_input.count-1 do
            loc = arr_input[i][0]
            @guesses[loc] = Hash.new
            arr_input[i][0..1] = ''

            arggg = arr_input[i].split(',')
            # @guesses[loc] = Hash.new
            for rest in 0..arggg.count-1 do
                the_split = arggg[rest].partition(':')

                # puts("FIRST: " + the_split[0] + " REST: " + the_split[2])
                @guesses[loc][the_split[0]] = the_split[2]

                @total_guesses += 1

                # puts @guesses[loc][the_split[0]]

            end
        end

        # @guesses["A"].key?("b") -- Check for key?
        # puts ("HELLO: " + @guesses["A"].key?("b").to_s)

        calculate_share()
    end

    def calculate_share()
        @guesses.each do |key, value|
            @contestant_share[key] = 0
            value.each do |k,v|
                if(v == @beans_count[k])
                    @contestant_share[key] += 2
                elsif (v.to_i == @beans_count[k].to_i + 1 or v.to_i == @beans_count[k].to_i - 1)
                    @contestant_share[key] += 1
                end
            end
            @total_shares += @contestant_share[key]
        end

        # puts "TOTAL SHARES: " + @total_shares.to_s + " TOTAL GUESSES: " + @total_guesses.to_s
    end

    def calculate_contestant_share(value)
        result = (((@total_guesses * 2) / @total_shares.to_f) * value)
    end

    def message_count()
        message = ""
        @contestant_share.each do |key, value|
            result = calculate_contestant_share(value)
            if result != 0 
                tail = key + ": " + sprintf( "%0.02f", result) + "\n"
                message << tail
            end
        end

        message.chop

    end
end