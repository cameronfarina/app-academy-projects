require 'tdd'

describe 'Array#my_uniq' do

    it "returns unique elements" do
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end

    it "returns empty array if given empty array" do
        expect([].my_uniq).to eq([])
    end

    it "does not modify original array" do 
        arr = [1,2,1,3,3]
        arr.my_uniq
        expect(arr).to be(arr)
    end
end

describe 'Array#two_sum' do 
    
    it "finds all pairs of positions that sum to 0" do   
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "finds multiple pairs" do
        expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
    end

    it "returns an empty array if given an empty array" do
        expect([].two_sum).to eq([])
    end

    it "will not return duplicate pairs" do
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[0, 4], [2, 3], [3, 2], [4, 0]])
    end

    it "returns an array of subarrays that start with a smaller index first" do
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[4, 0], [3, 2], [2, 3], [1, 1], [0, 4]])
    end

    it "should not include a subarray made up of the same indices" do 
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[0, 4], [1, 1], [2, 3]])
    end

end

describe 'Array#my_transpose' do

    it "returns rows of a grid in place of the columns
    and the columns of the grid in place of the rows" do 
        array = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]
        expect(array.my_transpose).to eq([
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
        ])
    end

end

describe 'stock_picker' do    

    it "returns the most profitable days in the form of indices" do
        expect(stock_picker([13, 21, 50, 40])).to eq([0, 2])
    end
    
    it "should not return immediately after making a profit" do   
        expect(stock_picker([13, 21, 50, 40])).to_not eq([0, 1])
    end

    it "should not return an array where the first index is greater than the second" do 
        expect(stock_picker([100, 10, 50, 40])).to_not eq([1, 0])
    end 

    it "should return an empty array if no profit can be made" do
         expect(stock_picker([10, 5, 3, 2]).to eq([])
    end

end