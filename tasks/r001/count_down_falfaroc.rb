#! /usr/bin/env ruby
require 'minitest/autorun'

# Minitest class for CountDown
class CountDownTest < Minitest::Test
    def test_takes_120_seconds
        time = 120
        # assert_operator CountDown.new(QuietPrintMethod.new).count_down(time), :==, time
        assert_operator CountDown.new(PrintMethod.new).count_down(time), :==, time
    end
end

# Handles the count in to 0 in seconds
class CountDown
    $start = 0
    $finish = 0
    
    def initialize(print_class)
        $print_class = print_class
    end

    def count_down time
        $print_class.print_m("Counting down till " + time.to_s + "\n")
        sec_count_down(time)
        diff = $finish - $start
        diff.round
    end

    # :reek:DuplicateMethodCall
    def sec_count_down wait_time
        $start = Time.now
        wait_time.downto(1).each do |time_left|
            sleep 1
            $print_class.print_m(time_left.to_s + " seconds left\n") if (time_left % 60) == 0
        end
        $finish = Time.now
    end
end

# Use to silently print to stdout
class PrintMethod
    def print_m(print_this)
        print print_this
    end
end

class QuietPrintMethod
    def print_m(print_this)
        "Not printing"
    end
end

