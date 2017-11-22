require 'spec_helper'
require './nim'

describe Nim do

    before (:each) do
        #Initialize object
        @Nim = Nim.new(Player.new)
        @output = StringIO.new

        # @input = StringIO.new("test info\n")
        # @output = StringIO.new
        # @input_received = @ui.receive(@input)
        # @ui.give("test message", @output)
    end

    #after smart computer makes the move, check_kernel_state should return true
    it 'computer makes move, return true' do
        @Nim.computerMakeMove()
		board = @Nim.board
        expect(@Nim.object.check_kernel_state(board)).to eq true
    end

    #Test kernel state of different board configurations
    it 'return false when check_kernel_state([1,4,5,7])' do
        expect(@Nim.object.check_kernel_state([1,4,5,7])).to eq false
    end

    it 'return true when check_kernel_state([1,3,5,7])' do
        expect(@Nim.object.check_kernel_state([1,3,5,7])).to eq true
    end

    it 'return true when check_kernel_state([4, 3, 7])' do
        expect(@Nim.object.check_kernel_state([4, 3, 7])).to eq true
    end

    it 'testing output stdout' do
        # expect do
        #     @Nim.start_game
        # end.to output("Welcome to NIM!").to_stdout

        # expect { @Nim.start_game(@output) }.to output("Welcome to NIM!").to_stdout

        io = StringIO.new
        io.puts '1'
        io.puts '1'
        io.rewind

        $stdin = io

        # @Nim.stub(:gets) {io}
        @Nim.start_game

        # STDIN.should_receive(:gets).and_return("1", "1")
        # @Nim.start_game
    end
end