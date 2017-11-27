Given(/I am computing the prime factors/) do
    @result = 0
end

When(/I input (\d+)/) do |inp1|
    @result = PrimeFactors.for(inp1)
end

Then(/I get back (.*)/) do |fin|
    # expect(fin).to eq(@result)
    puts "TESTING: #{fin}, #{@result}"
end