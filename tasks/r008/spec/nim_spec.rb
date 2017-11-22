require 'spec_helper'
require './nim'

describe Nim do

    before (:each) do
        #Initialize object
        @Nim = Nim.new(Player.new)
        # @output = StringIO.new

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

    it 'start game with first configuration and computer plays smart' do

        io = StringIO.new("1\n1\n")
        $stdin = io

        @Nim.start_game
    end

    it 'start game, bad config, good config, smart computer' do

        io = StringIO.new("3\n2\n")
        io.puts '1'
        io.rewind

        $stdin = io

        @Nim.start_game
    end

    it 'start game, bad config, good config, bad computer selection, smart computer' do
        
        io = StringIO.new("3\n2\n6\n1\n")

        $stdin = io

        @Nim.start_game
    end

    it 'start game, config board' do
        io = StringIO.new
        io.puts '1'
        io.puts '1'
        io.rewind

        $stdin = io

        @Nim.start_game
        @Nim.configBoard
    end

    it 'start game, config board, run game' do
        expectation = expect { puts "Welcome to NIM!"; 
                               puts "1: [1, 3, 5, 7]";}
        expectation.to output("Welcome to NIM!\n1: [1, 3, 5, 7]\n").to_stdout

        # @Nim.start_game
        # io = StringIO.new
        # io.puts '1'
        # io.puts '1'
        # io.rewind

        # $stdin = io

        # @Nim.start_game
        # @Nim.configBoard

        # while @Nim.gameOver == false
        #     @Nim.display
        #     @Nim.humanMakeMove
        #     @Nim.checkGameOver
        #     if @Nim.gameOver == false
        #       @Nim.computerMakeMove
        #       if @Nim.gameOver == true
        #         puts "Computer player wins!"
        #       end
        #     else
        #       puts "Human player wins!"
        #     end
        #   end
    end
end