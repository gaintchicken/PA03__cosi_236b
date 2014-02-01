class Maze
	attr_accessor :maze_array, :height, :width
	def initialize(n, m)
		@height = m + 2
		@width = n * 2 + 2
		@maze_array = Array.new(@height) {Array.new(@width)}
	end

	def load(arg)
		chars = arg.split('')
		for i in 0..@height -1
			for j in 0..@width - 1
				@maze_array[i][j] = chars.delete_at(0)
			end
		end
		
	end
end

m = Maze.new(4, 4)
m.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
puts m.maze_array.to_s
x = [1, 2, 3, 4]
puts x.delete_at(0)