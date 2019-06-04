require 'game'

describe Game do 
    subject(:tower) { Game.new }

    describe "#initialize" do
        it "takes in a 2d array representing a stack" do
            expect(tower.stacks).to eq([[3,2,1], [], []])
        end
    end

    describe "#dup" do  
        it "duplicates the original stack" do
            expect(tower.dup).to eq(tower.stacks)
        end
    end

    describe "#won?" do
        it "return true if game is over" do
            expect(tower.won?).to 
        end
    end
    
end