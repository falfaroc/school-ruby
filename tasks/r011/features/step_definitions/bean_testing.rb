Given(/I am computing the BeanCounter/) do
    @result = 0
end

When(/I input (.*)/) do |inp|
    print "INPUT: #{inp}"
    # @result = PrimeFactors.for(inp1)
end

Then(/I get back (.*)/) do |fin|
    print "OUTPUT: #{fin}"
    # fin = fin.gsub /^"|"$/, ''
    # final = fin.split(",").map { |s| s.to_i }
    # expect(final).to eq(@result)
end