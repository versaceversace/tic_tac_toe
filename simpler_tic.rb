class TicTacToe

  attr_reader :player1, :player2, :winner, :input, :greeting
  attr_accessor :board
  
  @winner = false

  def initialize
  	puts "Please enter a player:"
  	@player1 = gets.chomp
  	puts "Please enter another player:"
  	@player2 = gets.chomp
  	puts "Welcome to the game #{@player1} and #{@player2}! The board is shown below. 
  	Enter a number to choose that spot on the board. 
  	#{@player1} will be x and will go first.#{@player2} will go second and be o. 
  	To win the game, complete a full row, column or diagonal with your letter."
  	@board = create_new_board
  	print_board(@board)
  	new_game(@player1,@player2)
  end

  private  

  def new_game(player1,player2)
    until winner?(@board) || tie?(@board)
      player_turn(player1)
      unless winner?(@board) || tie?(@board)
        player_turn(player2)
      end
    end
    if winner?(@board)
      puts "#{@winner} wins!"
    elsif tie?(@board)
      puts "It's a tie!"
    else
      puts "Something went wrong."
    end
  end

  def player_turn(player)
    valid = false
    puts "#{player} please enter a number:"
    until valid
      @input = gets.chomp.to_s
      if valid_input?(@input)
      	valid = true
      else
      	puts "Number invalid. Please enter another number."
      end
    end
    add_input_to_board(@input,player)
    print_board(@board)
  end

  def valid_input?(input)
    @board.any? do |row|
      row.any? do |column|
        column == input
      end
    end
  end

  def add_input_to_board(input,player)
  	@board.each_with_index do |row,index1|
      row.each_with_index do |column,index2|
      	if column == input
          if player == @player1
 		    @board[index1][index2] = "X"
          else
            @board[index1][index2] = "O"
          end
        end
      end
    end
  end

  def create_new_board
  	[["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  def print_board(board)
    print board[0],"\n",board[1],"\n",board[2],"\n"
  end

  def winner?(board)
    if x_column?(board) || x_row?(board) || x_diagonal?(board)
      @winner = @player1
      true 
    elsif o_column?(board) || o_row?(board) || o_diagonal?(board)
      @winner = @player2
      true
    end
  end

  def x_column?(board)
  	if board[0][0] == "X" && board[1][0] == "X" && board[2][0] == "X"
  	  true
  	elsif board[0][1] == "X" && board[1][1] == "X" && board[2][1] == "X" 
      true
    elsif board[0][2] == "X" && board[1][2] == "X" && board[2][2] == "X"
      true
    else
      false
    end
  end

  def x_row?(board)
  	if board[0][0] == "X" && board[0][1] == "X" && board[0][2] == "X"
  	  true
  	elsif board[1][0] == "X" && board[1][1] == "X" && board[1][2] == "X"
  	  true
  	elsif board[2][0] == "X" && board[2][1] == "X" && board[2][2] == "X"
      true
    else
      false
    end
  end

  def x_diagonal?(board)
  	if board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X"
  	  true
  	elsif board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X"
  	  true
  	else
  	  false
  	end
  end

    def o_column?(board)
  	if board[0][0] == "O" && board[1][0] == "O" && board[2][0] == "O"
  	  true
  	elsif board[0][1] == "O" && board[1][1] == "O" && board[2][1] == "O" 
      true
    elsif board[0][2] == "O" && board[1][2] == "O" && board[2][2] == "O"
      true
    else
      false
    end
  end

  def o_row?(board)
  	if board[0][0] == "O" && board[0][1] == "O" && board[0][2] == "O"
  	  true
  	elsif board[1][0] == "O" && board[1][1] == "O" && board[1][2] == "O"
  	  true
  	elsif board[2][0] == "O" && board[2][1] == "O" && board[2][2] == "O"
      true
    else
      false
    end
  end

  def o_diagonal?(board)
  	if board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O"
  	  true
  	elsif board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O"
  	  true
  	else
  	  false
  	end
  end

  def tie?(board)
  	board.all? do |row|
  	  row.none? do |column|
  	    column.to_i.between?(1,9)
  	  end
  	end
  end
end



TicTacToe.new