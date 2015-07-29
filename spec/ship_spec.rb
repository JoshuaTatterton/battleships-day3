require 'ship'

describe Ship do
  let(:ship) {Ship.new(2, "vertical")}
  describe '#initialize#size#direction' do
    it 'allows players to choose from a range of ship sizes' do
      expect(ship.size).to eq 2
    end
  #  it "allows players to choose from a position" do
  #    expect(ship.position).to eq "E1"
  #  end
    it "allows players to choose from a direction" do
      expect(ship.direction).to eq "vertical"
    end
  end
  describe '#set_location' do
  	it { expect(ship).to respond_to(:set_location).with(2).argument }
  	it 'sets location and whether hit or not' do
  		ship2 = Ship.new(2,"horizontal")
  		ship2.set_location("A",1)
  		expect(ship2.location).to eq [[["A",1],false],[["B",1],false]]
  	end
  end
  describe '#hit' do
    it { expect(ship).to respond_to(:hit).with(1).argument }
    
    it { expect(ship).to respond_to(:hits) }

    it { expect(ship).to respond_to(:sunk?) }

    it 'will hit a ship' do
    	ship.location = [[["A",1],false], [["A",1],false]]
      ship.hit(0)
      expect(ship.hits).to eq [true,false]
    end

    it 'will sunk the ship if hit all section of the ship' do
    	ship.location = [[["A",1],false], [["A",1],false]]
      ship.hit(0)
      ship.hit(1)
      expect(ship).to be_sunk
    end

  end

end
