# Helper Method
#require 'pry'

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def won?(board)
  WIN_COMBINATIONS.each do |winner| #comes out with [0,1,2]

    win_index_1 = winner[0]
    win_index_2 = winner[1]
    win_index_3 = winner[2]


    position_1 = board[win_index_1] #store board position 0
    position_2 = board[win_index_2] #store board position 1
    position_3 = board[win_index_3] #store board position 2

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winner
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winner
    end
  end
  false
end

def full?(board)
  #The #full? method doesn't need to worry about draws or winning combinations,
  #simply return false if there is an available position and true if there is not.
  board.all? do |position|
    if position == "X" || position == "O"
      true
    end
  end
  false
end

def draw?(board)
  full_board = full?(board) #grab true (board full) or false (not full)
  won_board = won?(board) #return winner (if winner) or false (no winner)

    if full_board != false && won_board == !false #
      true
    end
end
