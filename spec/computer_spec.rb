require_relative '../lib/tictactoe/computer'

describe TicTacToe::Computer do
	before(:each) do
    @comp_player = TicTacToe::Computer.new
    @comp_player.shape = :X
  end

  it "should not be nil" do
    expect(@comp_player).not_to eq(nil)
  end

  it "should be the X player" do
    expect(@comp_player.shape).to eq(:X)
  end
end