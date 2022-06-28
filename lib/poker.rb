require 'json'
file = File.read('./hands.json')
hand = JSON.parse(file)

class Poker 

def initialise 
    score = 0
end

def card_number_sort(input)
  input.sort_by { |item| item["value"] }
end

def card_value(input)
  card_value =[]
  for i in 0...5 do
    card_value.push(input[i]["value"])
  end
  return card_value
end

def max_repeated_card_number(input)
  return input.tally.map{ |item, value| value}.max
end

def high(input)
  return input.tally.map{ |item, value| (value==3) ? item: 0}.max
end

def min_repeated_card_number(input)
  return input.tally.map{ |item, value| value}.min
end

def check_straight(input)
  check_striaght_array = []
  for i in 1...5 do  
      (input[i]["value"] - input[i-1]["value"] == 1) ? check_striaght_array.push(input[i]) : 1
  end
  return check_striaght_array
end

def check_flush(input)
    check_flush_array = []
  for i in 1...5 do
      (input[i]["suit"] == input[i-1]["suit"] ) ? check_flush_array.push(input[i]) : 1
  end
  return check_flush_array
end

def check_same_number(input)
    check_same_number_array = []
  for i in 1...5 do
      (input[i]["value"] == input[i-1]["value"] ) ? check_same_number_array.push(input[i]) : 1
  end
  return check_same_number_array.length
end


def straight_flush(input)
    a = card_number_sort(input)  
    b = check_flush(a)
    c = check_straight(a)
    (b.length == 4 && c.length ==4)? true : false
end

def fourofakind(input)
    a = card_number_sort(input)
    b = card_value(a)
    c = max_repeated_card_number(b)
    (c == 4) ? true : false 
  end

def fullhouse(input)
    a = card_number_sort(input)
    b = card_value(a)
    c = max_repeated_card_number(b)
    d = min_repeated_card_number(b)
  
   (c == 3 && d == 2) ? true : false
end

def flush(input)
  a = card_number_sort(input)  
  b = check_flush(a)
  (b.length == 4) ? true : false
end

def straight(input)
  a = card_number_sort(input)  
  b = check_straight(a)
  (b.length == 4)? true : false
end

def threeofakind(input)
  a = card_number_sort(input)
  b = card_value(a)
  c = max_repeated_card_number(b)
  d = min_repeated_card_number(b)
  (c == 3 && d == 1) ? true : false 
end

def twopairs(input)
  a = card_number_sort(input)
  b = card_value(a)
  c = max_repeated_card_number(b)
  d = check_same_number(a)

  (d == 2 && c == 2) ? true : false
end

def onepair(input)
  a = card_number_sort(input)
  b = card_value(a)
  c = max_repeated_card_number(b)
  d = check_same_number(a)

  (d == 1 && c == 2)? true : false
end

def highcard(input)
 
    a = card_number_sort(input)  
    b = card_value(a)    
    c = max_repeated_card_number(b)         
    d = check_flush(a)
    e = check_straight(a)

    if (d.length != 4 && e.length !=4 && c == 1)
      return b.max
    end
end

def score(hand)
  if straight_flush(hand) == true
    a= card_value(hand).max
    score = 160 + a
    return score
 elsif fourofakind(hand) == true
    a = card_value(hand)
    b = high(a)
    score = 140 + b
    return score
  elsif fullhouse(hand) == true
    a = card_value(hand)
    b = high(a)
    score = 120 + b
    return score
  elsif flush(hand) == true
    a= card_value(hand).max
    score = 100 + a
    return score
  elsif straight(hand) == true
    a= card_value(hand).max
    score = 80 + a
    return score
  elsif threeofakind(hand) == true
    a = card_value(hand)
    b = high(a)
    score = 60 + b
    return score
  elsif twopairs(hand) == true
    score = 40
    return score
  elsif onepair(hand) == true
    a = card_value(hand)
    b = high(a)
    score = 20 + b
  else 
    score = highcard(hand)
     return score
  end

end

def winner(hand)
  winner = []
  for i in 0...4     
    winner.push( [i, score(hand[i])] )  
  end
 
  a = winner.sort_by{|item| item[1]}.reverse

  b = a.map{|item, value|  item}
  c = b.each_with_index.map { |item, index| ["Ranking #{index+1}", hand[item]]}
 
end
end