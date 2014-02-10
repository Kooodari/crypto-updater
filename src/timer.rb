require 'time'

class Timer
	@start   = nil
	@end     = nil
	@mode    = false
	@trigger = nil

	def initialize(init = true)
		@start = (@end = Time.now) if init
		@mode = false
	end

	def start
		@start = Time.now
		@mode = true
	end

	def stop
		@end = Time.now
		@mode = true
	end

	def reset
		@start = (@end = Time.now)
		@mode = false
	end

	def difference(trigger = nil)
		if trigger != nil
			return eval("#{Time.now - @start}"+trigger)
		else
			return (@mode ? @end : Time.now) - @start
		end
	end
end
