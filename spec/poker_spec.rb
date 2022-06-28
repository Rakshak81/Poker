require_relative "../lib/poker.rb"
require 'json'
file = File.read('./hands.json')
hand = JSON.parse(file)


describe 'Poker' do
 
  it '1. Sorting hand in ascending order' do
    poker = Poker.new
    expect(poker.card_number_sort(
     hand[0]
      )).to eq(
          [
        {"suit"=>"spade", "value"=>1},
        {"suit"=>"heart", "value"=>5},
        {"suit"=>"club", "value"=>5},
        {"suit"=>"diamond", "value"=>5},
        {"suit"=>"heart", "value"=>8}])
  end

  it '2. sort by values only' do
    poker = Poker.new
    expect(poker.card_value(
     hand[0]
      )).to eq([5, 8, 1, 5, 5])
  end

  it '3. check for max repeated numbers' do
    poker = Poker.new
    max = poker.card_value(hand[0])
    expect(poker.max_repeated_card_number(
    max
      )).to eq(3)
  end

  it '4. check for min repeated numbers' do
    poker = Poker.new
    min = poker.card_value(hand[0])
    expect(poker.min_repeated_card_number(
    min
      )).to eq(1)
  end

  it '5. check for striaght or straight flush' do
    poker = Poker.new
    a = poker.card_number_sort(hand[3])
    expect(poker.check_straight(a)).to eq([{"suit"=>"club", "value"=>2}, {"suit"=>"heart", "value"=>3}, {"suit"=>"club", "value"=>4}, {"suit"=>"spade", "value"=>5}])
  end

  it '6. check for flush' do
    poker = Poker.new
    a = poker.card_number_sort(hand[1])
    expect(poker.check_flush(a)).to eq([{"suit"=>"club", "value"=>3}, {"suit"=>"club", "value"=>8}, {"suit"=>"club", "value"=>9}, {"suit"=>"club", "value"=>11}])
  end

  it '7. check number of repeated numbers - 1' do
    poker = Poker.new
    a = poker.card_number_sort(hand[0])
    expect(poker.check_same_number(a)).to eq(2)
  end

  it '8. straight flush' do
    poker = Poker.new
    expect(poker.straight_flush(hand[1])).to eq(false)
  end

  it '9. 4 of a kind' do
    poker = Poker.new
    expect(poker.fourofakind(hand[1])).to eq(false)
  end

  it '10.full house' do
    poker = Poker.new
    expect(poker.fullhouse(hand[1])).to eq(false)
  end

  it '11.flush' do
    poker = Poker.new
    expect(poker.flush(hand[1])).to eq(true)
  end

  it '12.straight' do
    poker = Poker.new
    expect(poker.straight(hand[1])).to eq(false)
  end

  it '13.straight' do
    poker = Poker.new
    expect(poker.straight(hand[3])).to eq(true)
  end

  it '14.threeofakind' do
    poker = Poker.new
    expect(poker.threeofakind(hand[3])).to eq(false)
  end

  it '15.threeofakind' do
    poker = Poker.new
    expect(poker.threeofakind(hand[0])).to eq(true)
  end

  it '16.twopairs' do
    poker = Poker.new
    expect(poker.twopairs(hand[3])).to eq(false)
  end

  it '17.onepair' do
    poker = Poker.new
    expect(poker.onepair(hand[3])).to eq(false)
  end

  it '18 check score' do
    poker = Poker.new
    expect(poker.score(hand[3])).to eq(85)
  end


  it '19 check score' do
    poker = Poker.new
    expect(poker.score(hand[0])).to eq(65)
  end

end

