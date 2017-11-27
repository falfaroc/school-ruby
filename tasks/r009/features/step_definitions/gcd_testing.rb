Given(/that I am calculating GCD/) do
    @result = 0
end

When(/I input the numbers (\d+) and (\d+)/) do |inp1, inp2|
    # puts "INPUT: #{inp1}, #{inp2}"
    @result = gcd(inp1, inp2)
end

Then(/I get back (\d+)/) do |fin|
    expect(fin).to eq(@result)
end