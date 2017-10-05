#! /usr/bin/env ruby

# Use to print to stdout
class PrintMethod
	def print_m(print_this)
		print print_this
	end
end

# Use to silently print
class QuietPrintMethod
	def initialize
		@time_log = []
		@log = []
		@start = Time.now
	end

	def print_m(print_this)
		@log.push(print_this)
		time = print_this.partition(" ").first

		@time_log.push(time)
	end

	# :reek:UncommunicativeMethodName
	def timeInterval
		finish = Time.now
		print("Time passed since first invocation: " + (finish - @start).to_s + "\n")
	end

	def log index
		@log.at(index)
	end

	def time_log(index)
		time = @time_log.at(index)
		time.to_i
	end

	def number_of_messages
		@time_log.count
	end
end
