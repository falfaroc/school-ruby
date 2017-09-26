#! /usr/bin/env ruby
require 'minitest/autorun'

# Minitest class for CountDown
class CountDownTest < Minitest::Test
    def test_takes_120_seconds
        count_down = CountDown.new
        time = 120
        assert_operator count_down.time_elapsed(time), :==, time
    end
end

# Handles the count in to 0 in seconds
class CountDown
    $start = 0
    $finish = 0

    def time_elapsed time
        print "Counting down till " + time.to_s + "\n"
        sec_count_down(time)
        diff = $finish - $start
        diff.round
    end

    # :reek:DuplicateMethodCall
    def sec_count_down wait_time
        $start = Time.now
        wait_time.downto(1).each do |time_left|
            sleep 1
            print time_left.to_s + " seconds left\n" if (time_left % 60) == 0
        end
        $finish = Time.now
    end

end

