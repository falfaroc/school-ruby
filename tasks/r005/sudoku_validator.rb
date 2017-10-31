require 'matrix'

# Parent class for creating and verifying 
# the Sudoku board
module Sudoku

  def self.validate(grid)
    board = Board.new(grid)
    board.solved?
  end

  def self.validate_without_matrix(grid)
    board = Board.new(grid)
    board.solved_without_matrix?
  end

  # Builds the sudoku board and solves
  # it if possible
  class Board

    VALID_CHUNK = (1..9).to_a.freeze
    BLOCK_SIZE = 3.freeze

    attr_reader :grid

    def initialize(grid)
      @grid = grid
      @columns = []
      @matrix = []
      @num_blocks = 0
    end

    def solved_init()
      @columns = grid.transpose
      @matrix = Matrix.rows(grid)
      @num_blocks = grid.size
    end

    def solved?
      return false unless @grid

      solved_init()

      blocks = build_blocks()

      (@grid + @columns + blocks).all? { |chunk| valid_chunk?(chunk) }
    end

    def solved_without_matrix?
      return false unless @grid

      blocks = build_blocks_without_matrix()

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

    def build_blocks_without_matrix()
      num_blocks = @grid.size
      blocks_per_row = blocks_per_col = num_blocks / BLOCK_SIZE

      blocks = (0...num_blocks).map do |block_index|
        blocks_map_traverse(blocks_per_row)
        # block = []
        
        # row_offset = (block_index / blocks_per_row) * BLOCK_SIZE
        # col_offset = (block_index % blocks_per_col) * BLOCK_SIZE

        # (0...BLOCK_SIZE).each do |row_index|
        #   build_blocks_without_matrix_col(row_index, row_offset, col_offset, block)
        # end

        #block
      end

      blocks
    end

    def row_offset_calc(block_index, blocks_per_row)
      (block_index / blocks_per_row) * BLOCK_SIZE
    end

    def col_offset_calc(block_index, blocks_per_col)
      (block_index % blocks_per_col) * BLOCK_SIZE
    end

    def blocks_map_traverse(blocks_per_row)
      block = []

      row_offset = row_offset_calc(block_index, blocks_per_row)
      col_offset = col_offset_calc(block_index, blocks_per_col)
      build_blocks_without_matrix_row(row_offset, col_offset, block)

      block
    end

    def build_blocks_without_matrix_row(row_offset, col_offset, block)
      (0...BLOCK_SIZE).each do |row_index|
        build_blocks_without_matrix_col(row_index, row_offset, col_offset, block)
      end
    end

    def build_blocks_without_matrix_col(row_index, row_offset, col_offset, block)
      (0...BLOCK_SIZE).each do |col_index|
        row = row_index+row_offset
        col = col_index+col_offset
        block << @grid[row][col]
      end
    end

    def valid_chunk?(chunk)
      VALID_CHUNK == chunk.sort
    end
  end

end
