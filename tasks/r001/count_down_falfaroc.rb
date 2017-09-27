#! /usr/bin/env ruby
require_relative "count_down_print"

# Handles the count in to 0 in seconds
class CountDown
	$start = 0
	$finish = 0
	
	def initialize(print_class)
		$print_class = print_class
	end

	def count_down time
		$print_class.print_m("Counting down till " + time.to_s)
		sec_count_down(time)
		diff = $finish - $start
		diff.round
	end

	# :reek:DuplicateMethodCall
	# :reek:FeatureEnvy
	def sec_count_down wait_time
		$start = Time.now
		wait_time.downto(1).each do |time_left|
				sleep 1
				$print_class.print_m(time_left.to_s + " seconds left") #if (time_left % 60) == 0
		end
		$finish = Time.now
	end
end

