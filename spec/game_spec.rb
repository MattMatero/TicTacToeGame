require_relative '../lib/tictactoe'

describe TicTacToe::Game do
	before(:each) do
    @game = TicTacToe::Game.new
  end

  after do
    $stdin = STDIN
  end

  it "should not be nil" do
    expect(@game).not_to eq(nil)
  end

  it "should have initialized data" do 
    expect(@game.board.data).to eql(TicTacToe::Board.new.data)
    expect(@game.players.first(2)).to eql([:X,:O])
    expect(@game.comp_player).not_to eq(nil)
    expect(@game.game_over).not_to eq(nil)
  end

  it "should change the current player" do
    @game.start_new_turn
    expect(@game.current_player).to eq(:X)

    @game.start_new_turn
    expect(@game.current_player).to eq(:O)
  end

  it "should get a position from user" do
    $stdin = StringIO.new("1 1\n")
    position = @game.move_input
    expect(position).to eq([1,1])
  end

  #Tests related to the rules mixin
  it "should not be a draw in the current state" do
    expect(@game.check_draw).not_to eq(true)
  end

  it "should not allow moves outside of the board" do
    $stdin = StringIO.new("5 4\n")
    InvalidRequest = Class.new(StandardError)

    @game.player = :X
    @game.comp_player.shape = :O
    @game.current_player = :X
    position = @game.move_input

    expect(position).to eq([5,4])
    expect{@game.check_move { |error_message| puts error_message }}
    .to raise_error InvalidRequest, 'Position is not within the grid' unless $stdin.eof?
  end
end