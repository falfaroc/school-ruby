require 'matrix'

# Parent class for creating and verifying 
# the Sudoku board
module Sudoku

  def self.validate(grid)
    board = Board.new(WithMatrix.new(grid))
    board.board_type.solved?
  end

  def self.validate_without_matrix(grid)
    board = Board.new(NoMatrix.new(grid))
    board.board_type.solved_without_matrix?
  end

  # Builds the sudoku board and solves
  # it if possible
  class Board

    VALID_CHUNK = (1..9).to_a.freeze
    BLOCK_SIZE = 3.freeze

    attr_reader :board_type

    def initialize(type)
      @board_type = type
    end

    # :reek:UtilityFunction
    def valid_chunk?(chunk)
      VALID_CHUNK == chunk.sort
    end
  end

  # Creates the board with matrix and
  # determines if it is valid
  class WithMatrix < Board
    attr_reader :grid

    def initialize(grid)
      @grid = grid
      @columns = []
      @matrix = []
      @num_blocks = 0
    end

    def solved_init()
      @matrix = Matrix.rows(grid)
      @num_blocks = grid.size
      @columns = @grid.transpose
    end

    def solved?
      return false unless @grid

      solved_init()

      blocks = build_blocks()

      (@grid + @columns + blocks).all? { |chunk| valid_chunk?(chunk) }
    end

    private 

    def build_blocks()
      blocks = []

      (0...@num_blocks).step(BLOCK_SIZE).each do |start_row|
        build_blocks_col(start_row, blocks)
      end
      blocks
    end

    def build_blocks_col(start_row, blocks)
      (0...@num_blocks).step(BLOCK_SIZE).each do |start_col|
          num_rows = num_cols = BLOCK_SIZE
          blocks << @matrix.minor(start_row, num_rows, start_col, num_cols).to_a.flatten
      end
    end
  end

  # Creates the board with no matrix and
  # determines if it is valid
  class NoMatrix < Board
    attr_reader :grid

    def initialize(grid)
      @grid = grid
      @blocks_per_col = 0
      @blocks_per_row = 0
      @block = []
    end

    def solved_without_matrix?
      return false unless @grid

      blocks = build_blocks_without_matrix()
      columns = []

      (@grid + columns + blocks).all? { |chunk| valid_chunk?(chunk) }
    end

    def build_blocks_without_matrix()
      num_blocks = @grid.size
      @blocks_per_row = @blocks_per_col = num_blocks / BLOCK_SIZE

      blocks = (0...num_blocks).map do |block_index|
        blocks_map_traverse(block_index)
      end

      blocks
    end

    def row_offset_calc(block_index)
      (block_index / @blocks_per_row) * BLOCK_SIZE
    end

    def col_offset_calc(block_index)
      (block_index % @blocks_per_col) * BLOCK_SIZE
    end

    def blocks_map_traverse(block_index)
      @block = []

      row_offset = row_offset_calc(block_index)
      col_offset = col_offset_calc(block_index)
      build_blocks_without_matrix_row(row_offset, col_offset)

      @block
    end

    def build_blocks_without_matrix_row(row_offset, col_offset)
      (0...BLOCK_SIZE).each do |row_index|
        build_blocks_without_matrix_col(row_index, row_offset, col_offset)
      end
    end

    def build_blocks_without_matrix_col(row_index, row_offset, col_offset)
      (0...BLOCK_SIZE).each do |col_index|
        row = row_index+row_offset
        col = col_index+col_offset
        @block << @grid[row][col]
      end
    end

  end

end
