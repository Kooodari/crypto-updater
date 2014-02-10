class Color
	def initialize
	end

	def Color.red
		return "\033[31;40m \b"
	end

	def Color.green
		return "\033[32;40m \b"
	end

	def Color.blue
		return "\033[36;40m \b"
	end

	def Color.white
		return "\033[37;40m \b"
	end
end
