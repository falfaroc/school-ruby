require 'spec_helper'
require './nim'

describe Nim do

    before (:each) do
        #Initialize object
        @Nim = Nim.new(Player.new)
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
end