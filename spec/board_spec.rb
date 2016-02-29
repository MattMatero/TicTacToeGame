require_relative '../lib/tictactoe/board'

describe TicTacToe::Board do
	before(:each) do
    @board = TicTacToe::Board.new
  end

  it "should not be nil" do
    expect(@board).not_to eq(nil)
  end

  it "should have initialized data" do
  	expect(@board.data).not_to eq(nil)
  	expect(@board.last_move).to eq(nil)
  end

  it "should have a blank board to start" do
  	expect(@board.covered?).to eq(false)
  end

  it "should find an open spot within board size" do
    position = @board.find_open_spot
    position.each do |index|
      expect(index >= 0).to eq(true)
      expect(index <= 2).to eq(true)
    end
  end

  it "should get all elements in a row or column" do
    @board[1,0] = :X
    @board[1,1] = :X
    @board[1,2] = :O
    row = @board.row(1)

    row.each_with_index do |spot,index|
      expect(@board[1,index]).to eq(spot)
    end

    @board[0,0] = :X
    @board[2,0] = :O
    column = @board.column(0)
    column.each_with_index do |spot,index|
      expect(@board[index,0]).to eq(spot)
    end
  end
end