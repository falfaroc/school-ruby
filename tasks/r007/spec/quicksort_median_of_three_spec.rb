require 'spec_helper'
require 'quicksort_median_of_three'

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
end