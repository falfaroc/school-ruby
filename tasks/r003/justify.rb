# Regex Help
# https://ruby-doc.org/core-2.1.1/Regexp.html
# \A  --> mathces beginning
# \z  --> matches end
# ?=  --> ensures the characters match, but doesn't include them (lookahead)
# ?<= --> ensures match, but doesn't include them (lookbehind)
# /s  --> any whitespace character
# .   --> any character except newline

def justify(text, width) 
    return unless text

    assert_length(text, width)

    regex_exp = /(?<=\s|\A).{1,#{width}}(?=\s|\z)/
    
    lines = text.scan(regex_exp)
    final_line = lines.pop

    final_justified = []
    lines.each do |line|
        final_justified << justify_line(line, width)
    end

    final_justified << final_line
    
    final_justified.join("\n")
end

def justify_line(line, width)
    num_of_spaces = width - line.length
    space_location = line.scan(' ').cycle

    if space_location.none? || num_of_spaces == 0
        return line
    end

    for i in 1..num_of_spaces do
        space_location.next << ' '
    end

    space_location.rewind
    
    line.gsub(' ') { |space| space_location.next }
end

def assert_length(words, width)
    too_long_regex = /\S{#{width}}/
    if words =~ too_long_regex
        raise "Cannot justify to width #{width} without word-splitting"
    end
end