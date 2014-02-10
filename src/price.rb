require './colors.rb'

class Price
	@price_old = nil
	@price_new = nil
	@price_str = ""
	@price_clr = nil
	
	def initialize(fresh = 0.0, old = 0.0)
		@price_new = fresh
		@price_old = old
		@price_clr = Color.blue
		@price_str = fresh.to_s
	end

	def price
		return [ @price_new, @price_old, @price_str ]
	end

	def price=(hash)
		@price_new = hash[0] if hash[0] != nil
		@price_old = hash[1] if hash[1] != nil
		@price_str = hash[2] if hash[2] != nil
	end

	def string
		return @price_str
	end

	def string=(price)
		@price_str = price
	end

	# This function doesn't work correctly.
	# It should provide information when price is changed.
	def changed?
		changed = (@price_new != @price_old)
		@price_old = @price_new
		return changed
	end

	def color
		return @price_clr
	end

	def Price.color=(color)
		@price_clr = color
	end

	def console_line(update, systime, updatetime)
		l  = ""
		l += update ? "\r" : "\n"
		l += Color.blue
		l += Time.at(systime.to_i).strftime("%T").to_s
		l += " " * (5 - updatetime.to_s.length)
		l += "[" + updatetime.to_s + "s]"
		l += Color.white
		l += " >> "
		l += @price_clr
		l += @price_str
		return l
	end
end
