require 'rspec'
require 'tdd'

describe Array do
  describe '#my_uniq' do
    subject(:arr) { Array.new([1,1,2,2,3,3]) }

    it "returns a unique array" do
      expect(arr.my_uniq).to eq(arr.uniq)
    end

    it "should not use default uniq method" do
      expect(arr).not_to receive(:uniq)
    end

    it "should not mutate the original array" do
      expect { arr.my_uniq }.not_to change { arr }
    end

  end

  describe '#two_sum' do
    subject(:arr) { Array.new([-1, 0, 2, -2, 1]) }

    it "returns the indices that sum two zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "ensures the result elements length is 2" do
      expect(arr.two_sum.all? { |x| x.length == 2 }).to eq(true)
    end

    it "ensures the result elements are sorted" do
      expect(arr.two_sum.all? { |x| x == x.sort }).to eq(true)
    end
  end

  describe '#my_transpose' do
    subject(:rows) { Array.new([[0, 1, 2], [3, 4, 5], [6, 7, 8]]) }

    it "all the rows are of equal length" do
      expect(rows.my_transpose.all? { |row| row.length == rows.length }).to eq(true)
    end

    it "returns correctly transposed array" do
      expect(rows.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe '#stock_picker' do
    subject(:stock) { %w(4 2 7 12 1 5 10).map(&:to_i) }
    let(:descending) { %w(9 8 7 6 5 4 3 2 1).map(&:to_i) }

    it "Returns the max profit" do
      expect(subject.stock_picker).to eq([1, 3])
    end

    it "Makes sure sale date is after buy date" do
      expect(subject.stock_picker == subject.stock_picker.sort).to eq(true)
    end

    it "Ensures result returns an array with buy date and sale date" do
      expect(subject.stock_picker.length).to eq(2)
    end

    it "Returns an empty array if no profit available" do
      expect(descending.stock_picker).to eq([])
    end
  end
end
