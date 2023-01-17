class TicTacToe

    def initialize # initializes an empty board
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6],  # First column
        [1,4,7],  # Second column
        [2,5,8],  # Third column
        [0,4,8],  # First diagonal
        [6,4,2],  # Second diagonal
    ]

    def display_board # prints the board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input) # converts user input to an integer
        input.to_i - 1
    end

    def move(index, token = "X") # allows "X" player in the top left and "O" in the middle
        @board[index] = token
    end

    def position_taken?(index) # returns true/false based on whether the position on the board is already occupied
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(index) # returns true/false based on whether the position is already occupied
        if @board[index] == " " && index[0..8]
            true
        end
    end

    def turn_count # returns the amount of turns based on board
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player # returns the correct player, X, for the third move
        turn_count.even? ? "X" : "O"
    end

    def turn # makes valid moves
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

end