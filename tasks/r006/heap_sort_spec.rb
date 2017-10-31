require 'spec_helper.rb'
require './heap_sort.rb'

describe HeapSort do
  it "should initialize a new HeapSort" do
    heap = HeapSort.new([2,3])
  end

  it "should return array ordered as [1, 2, 3]" do
    heap = HeapSort.new([3, 2, 1])
    expect(heap.heap_sort).to eq([1, 2, 3])
  end

  it "should return array ordered as [1, 3, 6, 7, 10, 15]" do
    heap = HeapSort.new([6, 1, 15, 3, 10, 7])
    expect(heap.heap_sort).to eq([1, 3, 6, 7, 10, 15])
  end

  it "it creates an array to be watched", :focus => true do
    arr = ArrayWatcher.new([[3, 2, 1]])
  end

  it "it access array and get accessor count", :focus => true do
    arr = ArrayWatcher.new([[3, 2, 1]])
    a = arr[1]
    arr[1] = 4
  end
end