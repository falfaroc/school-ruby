#! /usr/bin/env ruby
require 'minitest/autorun'

class CountDownTest < Minitest::Test
    def test_takes_120_seconds
        count_down = CountDown.new
        # assert count_down.length_period(120) == "Equals"
        time = 120
        assert_operator count_down.length_period(time), :==, time
    end
end

class CountDown
    def length_period time
        print "Counting down till " + time.to_s + "\n"
        wait_time = time
        start = Time.now
        wait_time.downto(1).each do |time_left|
            sleep 1
            print time_left.to_s + " seconds left\n" if (time_left % 60) == 0
        end
        finish = Time.now
        diff = finish - start
        diff.round
        # if time == diff.round
        #     "Equals"
        # end
    end
end

