#! /usr/bin/env ruby
require 'minitest/autorun'
require_relative "count_down_falfaroc"

# Minitest class for CountDown
class CountDownTest < Minitest::Test
	$time = 120

	def test_takes_120_seconds_quiet
		fake = QuietPrintMethod.new
		CountDown.new(fake).count_down($time)
		message = fake.log(1)
		assert_equal message, "120 seconds left"
		# assert_operator CountDown.new(fake).count_down($time), :==, $time
		# fake.timeInterval
	end

	# def test_takes_120_seconds_print
	# 	assert_operator CountDown.new(PrintMethod.new).count_down($time), :==, $time
	# end
end