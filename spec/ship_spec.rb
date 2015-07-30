require 'ship'

describe Ship do
  let(:ship) {Ship.new(2)}

  describe '#initialize#size' do
    it 'allows players to choose a ship sizes' do
      expect(ship.size).to eq 2
    end
    it "only allows specified ship sizes" do
    	expect{Ship.new(6)}.to raise_error "Not a valid ship size"
    end
    it { expect(ship).to respond_to(:direction) }
    it "has a default direction 'vertical'" do
    	expect(Ship.new(2).direction).to eq "vertical"
    end
  end

  describe '#set_location' do
  	it { expect(ship).to respond_to(:set_location).with(2).argument }
  	it 'sets location' do
  		ship2 = Ship.new(2)
  		ship2.set_location("A",1)
  		expect(ship2.location).to eq [["A",1],["A",2]]
  	end
  end

  describe '#hit' do
    it { expect(ship).to respond_to(:hit).with(1).argument }
    it { expect(ship).to respond_to(:hits) }
    it { expect(ship).to respond_to(:sunk?) }
    it 'will hit a ship' do
    	ship.location = [["A",1], ["A",1]]
      ship.hit(0)
      expect(ship.hits).to eq [true,false]
    end
    it 'will sunk the ship if hit all section of the ship' do
    	ship.location = [["A",1], ["A",1]]
      ship.hit(0)
      ship.hit(1)
      expect(ship).to be_sunk
    end
  end

  describe "#rotate" do
  	it { expect(ship).to respond_to(:rotate) }
  	it "changes the direction" do
  		ship.rotate
  		expect(ship.direction).to eq "horizontal"
  	end
  end
end
