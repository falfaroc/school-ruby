# Regex Help
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

    print lines
end

def assert_length(words, width)
    too_long_regex = /\S{#{width}}/
    if words =~ too_long_regex
        raise "Cannot justify to width #{width} without word-splitting"
    end
end