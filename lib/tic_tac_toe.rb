class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Last row
        [0,3,6], # First Col
        [1,4,7], # Second col
        [2,5,8], # Third col
        [0,4,8], # First Diagonal
        [2,4,6]  # Second Diagonal
    
      ]


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        index = input.to_i - 1
        index
    end

    def move(index, token="X")
        @board[index] = token 
    end  

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end 
    end

    def valid_move?(index)
        if index.between?(0,8) && !(@board[index] == "X" || @board[index] == "O")
            true
        else
            false
        end 
    end

    def turn_count
        @board.count("X") + @board.count("O")
    end

    def current_player
        if @board.count("X") - @board.count("O") == 0
            "X"
        elsif @board.count("X") - @board.count("O") == 1
            "O"
        end    
    end

    def turn
        # current_player
        puts "choose a position between 1 and 9"
       
        selected_index = input_to_index(gets)
        #position_taken?(indexfromuser)
        if valid_move?(selected_index) 
            move(selected_index, "#{current_player}")
            display_board
            
        else
        
        turn
        
        end


    end

    def won?
        WIN_COMBINATIONS.any? do |combination| 
            if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
                return combination
        
            end
        end
    end

    def full?
       if @board.all? {|i| i == "X" || i == "O" }
            true
       else
        false
       end
    end

    def draw?
        if full? && !won?
            true
        else
            false
        end
    end

    def over?
        if won? || full?
            true
    
        else
            false
        end
    end

    def winner
        if won?
            if current_player == "X"
                return "O"
            elsif current_player == "O"
                return "X"
            end
        end

    end

end  

