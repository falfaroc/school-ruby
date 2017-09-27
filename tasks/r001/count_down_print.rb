#! /usr/bin/env ruby

# Use to print to stdout
class PrintMethod
	def print_m(print_this)
		print print_this
	end
end

# Use to silently print
class QuietPrintMethod
	$start = Time.now
	LOG = []
	TIME_LOG = []

	# :reek:UtilityFunction
	def print_m(print_this)
		LOG.push(print_this)
		time = print_this.partition(" ").first

		TIME_LOG.push(time)
	end

	# :reek:UncommunicativeMethodName
	def timeInterval
		finish = Time.now
		print("Time passed since first invocation: " + (finish - $start).to_s + "\n")
	end

	# :reek:UtilityFunction
	def log index
		LOG.at(index)
	end

	def time_log(index)
		time = TIME_LOG.at(index)
		time.to_i
	end

	def number_of_messages
		TIME_LOG.count
	end
end
