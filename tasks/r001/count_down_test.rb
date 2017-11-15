#! /usr/bin/env ruby
require 'minitest/autorun'
require_relative "count_down_falfaroc"

# Minitest class for CountDown
class CountDownTest < Minitest::Test
	$time = 5

	def test_takes_120_seconds_quiet
		fake = QuietPrintMethod.new
		CountDown.new(fake).count_down($time)
		message = fake.log(1)
		assert_equal message, $time.to_s + " seconds left"
	end

	# :reek:FeatureEnvy
	def test_1_second_difference
		fake = QuietPrintMethod.new
		CountDown.new(fake).count_down($time)

		number_of_messages = fake.number_of_messages - 1
		# print "NUM: " + number_of_messages.to_s
		current_time = fake.time_log(number_of_messages)

		calculate_time(fake, number_of_messages, current_time)
	end

	# :reek:FeatureEnvy
	def calculate_time(fake, number_of_messages, current_time) 
		if number_of_messages > 1 
			(number_of_messages - 1).downto(1) { | next_message |
					next_time = fake.time_log(next_message)
					# print "C: " + current_time.to_s + + ", N: " + next_time.to_s + "\n"
					# assert_operator next_time, :==, current_time + 1
					assert (next_time + 1.1 > current_time && next_time + 1 < current_time)
					current_time = next_time
			}
		end
	end
end