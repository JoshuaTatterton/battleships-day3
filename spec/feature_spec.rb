require "board"

describe "features" do
  let(:board){Board.new}
  let(:ship){Ship.new(3, "vertical")}

  it "place ships at a location" do
    expect{board.place(ship,"A",1)}.not_to raise_error
  end
  it "place ships not of the board" do
    expect{board.place(ship,"Z",20)}.to raise_error "Out of bounds!"
  end
  it "do not place ships on top of other ships" do
  	board.place(ship,"A",1)
    expect{board.place(ship,"A",1)}.to raise_error "Already ship there!"
  end
  it "fire at a location" do
    expect{board.fire("A",1)}.not_to raise_error
  end
  it "sink a ship" do
  	board.place(ship,"A",1)
  	board.fire("A",1)
  	expect(ship.sunk?).to eq true
  end
  it "log attack locations of hit and misses" do
    board.fire("A",1)
    expect(board.fire_log[0]).to eq [["A",1],false]
  end
end