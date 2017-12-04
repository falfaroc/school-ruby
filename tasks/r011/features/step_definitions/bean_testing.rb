Given(/I am computing the BeanCounter/) do
    @result = 0
end

When(/I input (.*)/) do |inp|
    inp = inp.gsub /^"|"$/, '' #Removes quatation
    print "INPUT: #{inp}"

    @result = BeanCounting.new(inp)
end

Then(/I get back (.*)/) do |fin|
    print "OUTPUT: #{fin}"
    # fin = fin.gsub /^"|"$/, ''
    # final = fin.split(",").map { |s| s.to_i }
    # expect(final).to eq(@result)
end