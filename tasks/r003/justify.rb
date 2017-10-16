# Regex Help
# https://ruby-doc.org/core-2.1.1/Regexp.html
# \A  --> mathces beginning
# \z  --> matches end
# ?=  --> ensures the characters match, but doesn't include them (lookahead)
# ?<= --> ensures match, but doesn't include them (lookbehind)
# /s  --> any whitespace character
# .   --> any character except newline

def justify_init(width)
    @final_justified = []
    @regex_exp = /(?<=\s|\A).{1,#{width}}(?=\s|\z)/
    @too_long_regex = /\S{#{width}}/
end

def justify(text, width) 
    return unless text
    justify_init(width)
    assert_length(text, width)

    final_justification(text,width)
end

def final_justification(text, width)
    lines = text.scan(@regex_exp)
    final_line = lines.pop

    final_justified_append(lines, width)

    @final_justified << final_line
    @final_justified.join("\n")
end

def final_justified_append(lines, width)
    lines.each do |line|
        @final_justified << justify_line(line, width)
    end
end

def justify_line(line, width)
    return line if length_and_space_check(line, width)

    space_append()
    
    line.gsub(' ') { |space| @space_location.next }
end

def length_and_space_check(line, width)
    @num_of_spaces = width - line.length
    @space_location = line.scan(' ').cycle

    return (@space_location.none? || @num_of_spaces == 0)
end

def space_append()
    while @num_of_spaces > 0
        @num_of_spaces -= 1
        @space_location.next << ' '
    end

    @space_location.rewind
end

def assert_length(words, width)
    if @too_long_regex.match(words)
        raise "Cannot justify to width #{width} without word-splitting"
    end
end