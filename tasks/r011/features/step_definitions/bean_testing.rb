Given(/I am computing the BeanCounter/) do
    @result = 0
end

When(/I input (.*)/) do |inp|
    inp = inp.gsub /^"|"$/, '' #Removes quatation
    print "INPUT: #{inp}\n"

    @result = BeanCounting.new(inp)
end

Then("I get back {string}") do |fin|
    fin = fin.split('\n')
    final_string = ""
    for i in 0..fin.count-1 do
        final_string << fin[i] + "\n"
    end
    final_string = final_string.chop

    expect(@result.message_count).to eq(final_string)
end