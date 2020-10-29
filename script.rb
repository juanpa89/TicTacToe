def print_title
    title = 
    "      _   _      _             _             
     | | (_)    | |           | |            
     | |_ _  ___| |_ __ _  ___| |_ ___   ___ 
     | __| |/ __| __/ _` |/ __| __/ _ \\ / _ \\
     | |_| | (__| || (_| | (__| || (_) |  __/
      \\__|_|\\___|\\__\\__,_|\\___|\\__\\___/ \\___| "

    puts title
end

def get_user_name
    print "\n \n \t What's the first player's name?\t"
    $player1 = gets.chomp
    print "\n \n \t What's the second player's name?\t"
    $player2 = gets.chomp
end



class Board
    attr_accessor :seven, :eight, :nine, :four, :five, :six,
     :one, :two, :three
    def initialize 
        @seven = " "
        @eight = " "
        @nine = " "

        @four = " "
        @five = " "
        @six = " "

        @one = " "
        @two = " "
        @three = " "

    end
    def print_board
        puts "\n
        7    |8    |9    
          #{self.seven}  |  #{self.eight}  |  #{self.nine}   
        -----+-----+-----
        4    |5    |6    
          #{self.four}  |  #{self.five}  |  #{self.six}  
        -----+-----+-----
        1    |2    |3    
          #{self.one}  |  #{self.two}  |  #{self.three}  \n\n"
    end
    def clear
        system('clear')
        print_title
    end

    def put_X (number)
        if number == 7
            self.seven = "X"
        elsif number == 8
            self.eight = "X"
        elsif number == 9
            self.nine = "X"
        elsif number == 4
            self.four = "X"
        elsif number == 5
            self.five = "X"
        elsif number == 6
            self.six = "X"
        elsif number == 1
            self.one = "X"
        elsif number == 2
            self.two = "X"
        elsif number == 3
            self.three = "X"
        end
    end

    def put_O (number)
        if number == 7
            self.seven = "O"
        elsif number == 8
            self.eight = "O"
        elsif number == 9
            self.nine = "O"
        elsif number == 4
            self.four = "O"
        elsif number == 5
            self.five = "O"
        elsif number == 6
            self.six = "O"
        elsif number == 1
            self.one = "O"
        elsif number == 2
            self.two = "O"
        elsif number == 3
            self.three = "O"
        end
    end

    def print_winner_X
        puts "Game over"
        puts "The winner is #{$player1}"
        exit
    end

    def print_winner_O
        puts "Game over"
        puts "The winner is #{$player2}"
        $playing = false
    end

    def print_draw
        puts "Game Over"
        puts "It's a draw"
        exit
    end

    def all_full?
        boxes = [self.seven, self.eight, self.nine, self.four, self.five, self.six, self.one, self.two, self.three]
        all_full = true
        boxes.each do |box|
            if box == ' '
                all_full = false
            end
        end
        all_full
    end


    def check_winner
        if self.seven == 'X' && self.eight == 'X' && self.nine == 'X'
            self.print_winner_X
        elsif self.seven == 'X' && self.four == 'X' && self.one == 'X' 
            self.print_winner_X
        elsif self.seven == 'X' && self.five == 'X' && self.three == 'X'
            self.print_winner_X
        elsif self.eight == 'X' && self.five == 'X' && self.tow == 'X'
            self.print_winner_X
        elsif self.nine == 'X' && self.six == 'X' && self.three == 'X'
            self.print_winner_X
        elsif self.nine == 'X' && self.five == 'X' && self.one == 'X'
            self.print_winner_X
        elsif self.four == 'X' && self.five == 'X' && self.six == 'X'
            self.print_winner_X
        elsif self.one == 'X' && self.two == 'X' && self.three == 'X'
            self.print_winner_X
        elsif self.seven == 'O' && self.eight == 'O' && self.nine == 'O'
            self.print_winner_O
        elsif self.seven == 'O' && self.four == 'O' && self.one == 'O' 
            self.print_winner_O
        elsif self.seven == 'O' && self.five == 'O' && self.three == 'O'
            self.print_winneR_O
        elsif self.eight == 'O' && self.five == 'O' && self.two == 'O'
            self.print_winner_O
        elsif self.nine == 'O' && self.six == 'O' && self.three == 'O'
            self.print_winner_O
        elsif self.nine == 'O' && self.five == 'O' && self.one == 'O'
            self.print_winner_O
        elsif self.four == 'O' && self.five == 'O' && self.six == 'O'
            self.print_winner_O
        elsif self.one == 'O' && self.two == 'O' && self.three == 'O'
            self.print_winner_O
        elsif self.all_full?
            self.print_draw
        else
            $playing = true
        end
    end
end


$playing = true
board = Board.new
$player1 = ''
$player2 = ''

board.clear
get_user_name
board.clear
board.print_board
while $playing == true
    print "\n\t#{$player1}, Where would you like to play? \t"
    answer_player1 = gets.chomp
    board.put_X(answer_player1.to_i)
    board.clear
    board.print_board
    board.check_winner
    print "\n\t#{$player2}, Where would you like to play? \t"
    answer_player2 = gets.chomp
    board.put_O(answer_player2.to_i)
    board.clear
    board.print_board
    board.check_winner
end






 