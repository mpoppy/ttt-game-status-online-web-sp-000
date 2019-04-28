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
#board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]


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
    else
      false
    end
  end
end

def draw?(board)
  full_board = full?(board) #grab true (board full) or false (not full)
  won_board = won?(board) #return winner (if winner) or false (no winner)

    if won_board == false && full_board == false
      false
    elsif won_board != false
      false
    else
      true
    end
end

def over?(board)
  full_board = full?(board) #true if full
  won_board = won?(board) #false if not a winner
  draw_board = draw?(board) #true is a draaw

  if won_board != false || full_board == true || draw_board == true
    true
  end
end

board = ["X", "X", "X", "O", " ", "X", "O", "X", "O"]

def winner(board)
  won_array = won?(board) #this will return the winning array or the false if no winner 0,1,2


  if won?(board) != false
    winning_char_1 = won_array[0]
    position_1 = board[winning_char_1]
    return position_1
  else
    nil
  end
end
