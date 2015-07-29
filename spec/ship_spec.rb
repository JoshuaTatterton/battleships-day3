require 'ship'

describe Ship do
  let(:ship) {Ship.new("E1", 3, "vertical")}
  describe '#initialize#size#direction' do
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

  describe '#hit' do
    it { expect(ship).to respond_to(:hit) }
    
    it { expect(ship).to respond_to(:hit?) }

    it { expect(ship).to respond_to(:sunk?) }

    it 'will hit a ship' do
      ship.hit
      expect(ship).to be_hit
    end

    it 'will sunk the ship if hit all section of the ship' do
      ship.hit
      expect(ship).to be_sunk
    end

  end

end
