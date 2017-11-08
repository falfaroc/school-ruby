require 'spec_helper'
require 'quicksort_median_of_three'
require 'timeout'

RSpec.configure do |c|
    c.around(:each) do |example|
      Timeout::timeout(2) {
        example.run
      }
    end
end

describe Sort do
  subject { Sort }

  describe  "choose_pivot" do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.choose_pivot(input, 0, input.length - 1)}

    it "choose pivot element" do
      expect(output).to eq 0
    end
  end

  describe("partition") do
    let(:input) { [3, 6, 2, 3, 9, 7] }
    let(:output) { subject.partition(input, 0, input.length - 1) }

    it "partition around the pivot.return index of the pivot element" do
      expect(output).to eq 2
    end
  end

  describe("insersorting") do
    let(:input) { [3, 6, 2, 3, 9, 7] }
    let(:output) { subject.insertionSort(input, 0, input.length - 1) }

    it "sort" do
      expect(output).to eq [2,3,3,6,7,9]
    end
  end

  describe  "quicksot" do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it "sort of array" do
      expect(output).to eq [2,3,3,6,7,9]
    end
  end

  describe  "quicksot_large" do
    let(:input) {[3,6,2,3,9,7,3,6,2,3,9,7,3,6,2,3,9,7,3,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it "sort of array" do
      expect(output).to eq [2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 7, 7, 7, 7, 9, 9, 9, 9]
    end
  end

  describe  "choose_pivot middle" do
    let(:input) {[3,6,6,3,9]}
    let(:output) {subject.choose_pivot(input, 0, input.length - 1)}

    it "choose middle pivot element" do
      expect(output).to eq 2
    end
  end

  describe "choose_pivot lo nil value" do
    let(:input) {[3,6,6,3,9]}
    let(:output) {subject.choose_pivot(input, nil, input.length - 1)}

    it "raise" do
        expect{output}.to raise_error(NoMethodError)
    end
  end

  describe "choose_pivot hi out of range" do
    let(:input) {[3,6,6,3,9]}
    let(:output) {subject.choose_pivot(input, 0, 20)}

    it "raise" do
        expect{output}.to raise_error(IndexError)
    end
  end

  describe "choose_pivot lo > hi" do
    let(:input) {[3,6,6,3,9]}
    let(:output) {subject.choose_pivot(input, 4, 2)}

    it "choose a pivot" do
        expect(output).to eq 2
    end
  end

end