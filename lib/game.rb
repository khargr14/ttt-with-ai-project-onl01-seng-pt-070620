# class Game
#   attr_accessor :board

#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
#   ]

#   def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
#     @board = board
#     @player_1 = Player::Computer.new("X")
#     @player_2 = Player::Computer.new("O")
#   end

#   def start
#     puts "Welcome to Tic Tac Toe!"
#     play
#     @board.display
#   end

#   def over?
#     won? || draw?
#   end

#   def current_player
#     @board.turn_count % 2 == 0 ? @player_1 : @player_2
#   end

#   def winner
#     if winning_combo = won?
#       @winner = @board.cells[winning_combo.first]
#     end
#   end

#   def turn
#     player = current_player
#     current_move = player.move(@board)
#     if !@board.valid_move?(current_move)
#       turn
#     else
#       puts "Turn: #{@board.turn_count+1}\n"
#       @board.display
#       @board.update(current_move, player)
#       puts "#{player.token} moved #{current_move}"
#       puts "\n\n"
#     end
#   end

#   def play
#     while !over?
#       turn
#     end
#     if won?
#       puts "Congratulations #{winner}!"
#     elsif draw?
#       puts "Cats Game!"
#     end
#   end

#   def won?
#     WIN_COMBINATIONS.detect do |combo|
#       @board.cells[combo[0]] == @board.cells[combo[1]] &&
#       @board.cells[combo[1]] == @board.cells[combo[2]] &&
#       @board.taken?(combo[0]+1)
#     end
#   end

#   def draw?
#     @board.full? && !won?
#   end
# end


class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5],
[6, 7, 8], [0, 4, 8],
[2, 4, 6], [0, 3, 6],
[1, 4, 7], [2, 5, 8],
]

def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end
v
def current_player
 if board.turn_count.even?
   return @player_1
  else
   @player_2
  end
end

def won?
  WIN_COMBINATIONS.detect { |win_combination|
          @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
          @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
          @board.taken?(win_combination[0]+1)}
  end

  def draw?
  @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end
end