class BeanCounting
    def initialize(input)
        @input = input 
        @beans = 'aadddddddddddddddddddddddffffffffffffffffwwwwwwwwwwwwccccalalala'
        string_count()
    end

    def string_count()
        puts  ("Number of a's: " + @beans.count('a').to_s + " d's: " + @beans.count('d').to_s + " f's: " + @beans.count('f').to_s + " w's: " + @beans.count('w').to_s + " c's: " + @beans.count('c').to_s + " l's: " + @beans.count('l').to_s)
    end
end