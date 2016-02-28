module TicTacToe
  class Game
    include TicTacToe::Rules
    
    def initialize
      @board       = TicTacToe::Board.new
      @players     = [:X, :O].cycle
      @game_over   = nil
      @player      = nil
      @comp_player = TicTacToe::Computer.new
    end

    attr_reader :board, :players, :current_player, :game_over, :player, :comp_player

    def play
      select_player
      until @game_over == true do
        start_new_turn
        show_board  

        check_move { |error_message| puts error_message if @player == @current_player}
        check_win  { puts '#{current_player} wins' }
        check_draw { puts 'It\'s a tie' }
      end
      show_board
    end

    def select_player
      puts 'Are you X or O?'
      @player = gets.chomp.to_sym
      until [:X,:O].include? @player
        puts 'Incorrect Selection, try again.'
        @player = gets.chomp.to_sym
      end
      @comp_player.shape = [:X,:O].collect(&:to_s).reject!{|e| e == @player.to_s}[0].to_sym
    end

    def start_new_turn
      @current_player = @players.next
    end

    def show_board
      puts @board
    end

    def game_over
      @game_over = true
    end

    def move_input
      print '\n>>(row col) ' 
      response = gets
      
      row, col = response.chomp.split.map { |e| e.to_i }
      puts

      [row, col]
      end
    end
  end
end
