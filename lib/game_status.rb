# Helper Method
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

def won?(board)
  winner_exist = false
  return false if board.all? { |entry| entry == " "}

  WIN_COMBINATIONS.each do |winner|
    row = [board[winner[0]], board[winner[1]], board[winner[2]]]
    return winner if row.count("X") == 3 || row.count("O") == 3
  end
  winner_exist
end

def full?(board)
  board.count == 9 && board.include?("X") && !board.include?(" ")
end

def draw?(board)
  return true if !won?(board) && (board.count("X") + board.count("O") == 9)
  return false
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    return nil
  end
end
