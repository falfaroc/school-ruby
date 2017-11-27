Given(/I am computing the prime factors/) do
    @result = 0
end

When(/I input (\d+)/) do |inp1|
    @result = PrimeFactors.for(inp1)
end

Then(/I get back (.*)/) do |fin|
    fin = fin.gsub /^"|"$/, ''
    final = fin.split(",").map { |s| s.to_i }
    expect(final).to eq(@result)
end