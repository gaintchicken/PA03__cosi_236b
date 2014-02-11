require_relative 'MazeSolver'
class Maze
	attr_accessor :maze_array, :height, :width
	def initialize(n, m)
		@height = m * 2 + 1
		@width = n * 2 + 1
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

	def display()
		@maze_array.each  do |line_array|
			line_array.each  do |char|
				print char
			end
			puts ""
		end
	end
end

puts "creating new 4 x 4 maze"
m = Maze.new(4, 4)
puts "loading in the maze 111111111100010001111010101100010101101110101100000101111011101100000101111111111"
m.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
puts "displaying maze"
m.display
puts "creating new mazeSolver object to solve maze"
ms = MazeSolver.new(m)
"is 1,1 to 1,4 solveable?"
puts ms.solve(1,1,1,4)
puts "Final maze"
m.display()