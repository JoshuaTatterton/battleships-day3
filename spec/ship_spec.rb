require 'ship'

describe Ship do
  describe '#initialize#size#direction' do
  	let(:ship) {Ship.new("E1", 3, "vertical")}
    it 'allows players to choose from a range of ship sizes' do
      expect(ship.size).to eq 3
    end
    it "allows players to choose from a position" do
      expect(ship.position).to eq "E1"
    end
    it "allows players to choose from a direction" do
      expect(ship.direction).to eq "vertical"
    end
  end

end
