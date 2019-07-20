class TicTacToe

WIN_COMBINATIONS = [ # All possible winning combinations are included here. These never change
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom Row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left, bottom right diagonal
  [2,4,6] # Top right, bottom left diagonal
]

  def initialize # Create a new board at game start. The board has 9 empty string
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)
    #integer = input.to_i - 1 # A gets method is not needed here since the test handles that
    x = input.to_i - 1
  end

  def move(input,token = "X")
    @board[input] = token
  end

  def position_taken?(input)
    if @board[input] == "X"
      true
    elsif @board[input] == "O"
      true
    else
      false
    end
    # if @board[input] != " "
    #   true
    # else
    #   false
    # end
  end

  def valid_move?(input)
    if position_taken?(input) == false # If the position is not already taken. A while condition here runs forever
      if input > 8 # If it is greater than 8 (and doesn't fit on the board)...
        false
      else input < 8 # If it less than 8, ok to make a move
        true
      end
    end
  end

  def turn_count
    9 - @board.count(" ") # Total square, minus empty squares equals total number of turns so far
  end

  def current_player
    if turn_count.odd? == true
      "O"
    else
      "X"
    end
  end

  def turn(input, token)
    # puts "Howdy! Select a position between 1-9."
    input = nil
    input = gets
    input_to_index(input)

    token = current_player

    if valid_move?(input) == true
      @board[input] = token
      display_board
    else
      puts "Howdy! Select a position between 1-9."
    end

    # "calls #input_to_index, #valid_move?, and #current_player"
    # ask for input
    # get input
    # translate input into index
    # if index is valid
    #   make the move for index
    #   show the board
    # else
    #   ask for input again
    # end

  end

end
