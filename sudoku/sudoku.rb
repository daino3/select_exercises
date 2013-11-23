require 'pry'
require 'debugger'
class Sudoku
  attr_accessor :string, :game_board, :answers
 
  def initialize(string)
    @answers = (1..9).to_a.map(&:to_s)
    @string_array = string.split("")
    @solved_board = Array.new(9) { @string_array.shift(9) }
    @box_hash = {"[0, 0]" => 0,
                 "[1, 0]" => 1,
                 "[2, 0]" => 2,
                 "[0, 1]" => 3,
                 "[1, 1]" => 4,
                 "[2, 1]" => 5,
                 "[0, 2]" => 6,
                 "[1, 2]" => 7,
                 "[2, 2]" => 8 } 
  end                 
 
  def print_board(board)
    board.each do |array|
      smile = array.join('  ')
      print "#{smile}\n" 
    end
  end
 
  def solve
    until solved?
      9.times do |y|
        9.times do |x|
          if @solved_board[y][x] == '0'
            if check_cell(y, x).length == 1
              @solved_board[y][x] = check_cell(y, x)[0]
            end 
          end
        end
      end
    end
    print_board(@solved_board)
  end
 
  def solved?
    if @solved_board.flatten.include?("0")
      false
    else
      true
    end
  end  
 
  def check_row(y, x)
   row_array = @solved_board[y]
  end
 
  def check_column(y, x)
    column_array = @solved_board.transpose[x]
  end
    
  def check_cell(y, x)
    row_array = check_row(y, x)
    column_array = check_column(y, x)
    box_array = get_box_array_to_check(y, x)

    possible_values_array = @answers - (row_array + column_array + box_array) 
    possible_values_array
  end

  def get_box_array_to_check(y, x)
    index = find_box_index(y, x)
    array = group_box_arrays(index)
    array
  end

  def find_box_index(y, x)
    box_y_coordinate = y / 3
    box_x_coordinate = x / 3
    box_coordinate = [box_y_coordinate, box_x_coordinate]
 
    print "location of box: [#{y}, #{x}] = [#{box_y_coordinate},#{box_x_coordinate}]", "\n" 
    
    box_index = @box_hash[box_coordinate.to_s].to_i
  end
 
  def group_box_arrays(box_num)
    regrouped_box_array = []
 
    3.times do |index| 
      @solved_board.each do |row|
        regrouped_box_array << row[3*index, 3]
      end
    end
    
    final_box_array = []
    
    regrouped_box_array.flatten.each_slice(9) do |group| 
      final_box_array << group
    end
    final_box_array[box_num]
  end
end
 
game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')
 
game.solve