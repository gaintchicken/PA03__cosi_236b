class Point
	attr_accessor :x, :y, :parent
	def initialize(x, y, parent)
		@x = x
		@y = y
		@parent = parent
	end
end