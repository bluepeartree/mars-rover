class Rover

def initialize
  @x_coor = 0
  @y_coor = 0
  @direction = "N"
  @directions = { "N" => ["E", "W"], "S" => ["W", "E"], "E" => ["S", "N"], "W"=> ["N", "S"] }
  @x_max = 100
  @y_max = 100
end

#readers
def x_coor
  @x_coor
end

def y_coor
  @y_coor
end

def direction
  @direction
end

#writers
def x_coor=(x_coor)
  @x_coor = x_coor
end

def y_coor=(y_coor)
  @y_coor = y_coor
end

def direction=(direction)
  @direction = direction
end

def read_instruction(instruction)
  if instruction == "M"
    move
  else
    turn(instruction)
  end
end

def move
  if @direction == "N" && @y_coor < @y_max
    @y_coor += 1
  elsif @direction == "S" && @y_coor > 0
    @y_coor -= 1
  elsif @direction == "E" && @x_coor > 0
    @x_coor -= 1
  elsif @direction == "W" && @x_coor < @x_max
    @x_coor += 1
  else puts "Cannot move rover out of range."
  end
end

def turn(instruction)
  if instruction == "L"
    @direction = @directions[@direction][0]
  else
    @direction = @directions[@direction][1]
  end
end

def display
  puts "X-coordinate is #{@x_coor}."
  puts "Y-coordinate is #{@y_coor}."
  puts "Facing direction #{@direction}."
end

def get_instruction
  puts "Please enter your instructions M (move) /L (left) /R (right) / X (exit)"
  instruction = gets.chomp
  acceptable_instructions = ["M","L","R", "X"]
  if acceptable_instructions.include?(instruction)
    read_instruction(instruction)
  else
    puts "incorrect input."
  end
  if instruction == "X"
    puts "Mars rover signing off..."
    abort()
  end
end

end

rover = Rover.new

loop do
  puts "Mars rover initializing... "
  rover.display
  rover.get_instruction
end
