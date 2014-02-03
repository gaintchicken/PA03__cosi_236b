require_relative 'Point'
class MazeSolver
	attr_accessor :maze_array, :maze

	def initialize(maze)
		@maze_array = maze.maze_array
		@maze = maze
	end

	def solve(begX, begY, endX, endY)
		start_point = Point.new(begX * 2 - 1, begY * 2 - 1, nil) #make the start point those points in the array
		end_point = Point.new(endX * 2 - 1, endY * 2 - 1, nil) #same with end point
		bfs(start_point, end_point)
	end

	def bfs(start_point, end_point)
		queue = []
		found_end = false
		queue << start_point
		while(!queue.empty? && !found_end)
			curr = queue.shift	
			if (@maze_array[curr.y][curr.x - 1] == '0')then #spot to left
				queue << Point.new(curr.x - 2, curr.y, curr) 
				@maze_array[curr.y][curr.x - 1] = 'x' #mark as read
			end
			if (@maze_array[curr.y][curr.x + 1] == '0')then #spot to right
				queue << Point.new(curr.x + 2, curr.y, curr) 
				@maze_array[curr.y][curr.x + 1] = 'x' #mark as read
			end
			if (@maze_array[curr.y - 1][curr.x] == '0')then #spot above
				queue << Point.new(curr.x,curr.y - 2, curr) 
				@maze_array[curr.y - 1][curr.x ] = 'x' #mark as read
			end
			if (@maze_array[curr.y + 1][curr.x] == '0')then #spot below
				queue << Point.new(curr.x, curr.y + 2, curr) 
				@maze_array[curr.y + 1][curr.x ] = 'x' #mark as read
			end
			found_end = (curr.x == end_point.x && curr.y == end_point.y)
		end
		if found_end then
			while curr.parent != nil do 
				@maze_array[curr.y][curr.x] = 'X'
				curr = curr.parent
			end
		end
		found_end
	end

end