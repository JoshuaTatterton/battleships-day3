require 'board'

describe Board do
  let(:ship) {double :ship, size: 2, direction: "vertical", location: [["A",1],["A",2]], set_location: true }

  describe '#place' do
  	it { is_expected.to respond_to(:place).with(3).argument }
    it 'places ship in board location' do
      subject.place(ship,"A",1)
      expect(subject.board[0][0]).to eq "s"
    end
    it "should not let you place a ship outside of the board" do
      expect{subject.place(ship,"Z",20)}.to raise_error "Out of bounds!"
    end
    it "ship cannot overlap the outside of the board" do
      expect{subject.place(ship,"J",10)}.to raise_error "Out of bounds!"
    end
    it "should not let you place ships on top of other ships" do
      subject.place(ship,"A",1)
      expect{subject.place(ship,"A",2)}.to raise_error "Already ship there!"
    end
    it "ships cannlot overlap existing ships" do
      subject.place(ship,"A",2)
      expect{subject.place(ship,"A",1)}.to raise_error "Already ship there!"
    end    
  end
  describe '#fire' do
  	it { is_expected.to respond_to(:fire).with(2).argument}
  	it 'should fire on target' do
  	  ship = spy :ship, size: 2, location: [["A",1],["A",2]]
  	  subject.place(ship, "A", 1)
  	  subject.fire("A", 1)
	  	expect(ship).to have_received :hit
  	end
  	it 'should report miss if it does not hit a ship' do
  	  expect(subject.fire("A", 1)).to eq false
  	end
  	it "should not let you place a ship outside of the board" do
      expect{subject.fire("Z",20)}.to raise_error "Out of bounds!"
    end
    it { is_expected.to respond_to(:fire_log)}
    it "should log where we fire" do
      subject.fire("A",1)
      expect(subject.fire_log[0]).to eq [["A",1], false]
    end
    it "raises notification when ship is sunk" do
    	allow(ship).to receive(:hit)
    	allow(ship).to receive(:sunk?){true}
    	subject.place(ship, "A", 1)
    	subject.fire("A", 1)
    	expect(subject.fire("A", 2)).to eq "You sunk my submarine!"
    end
  end
end
