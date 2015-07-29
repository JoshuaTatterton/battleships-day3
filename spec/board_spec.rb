require 'board'

describe Board do
  describe '#place' do
  	it { is_expected.to respond_to(:place).with(3).argument }
    it 'places ship in board location' do
      ship = double :ship
      subject.place(ship,"A",1)
      expect(subject.board[0][0]).to eq ship
    end
    it "should not let you place a ship outside of the board" do
      ship = double :ship
      expect{subject.place(ship,"Z",20)}.to raise_error "Out of bounds!"
    end
    it "should not let you place ships on top of other ships" do
      ship = double :ship
      subject.place(ship,"A",1)
      expect{subject.place(ship,"A",1)}.to raise_error "Already ship there!"
    end
  end
end
