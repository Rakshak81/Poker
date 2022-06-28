# Poker

I have Assumed that the game will be played using one set of 52 cards. This program will not include Joker.

# Technologies

Ruby
Rspec

# Setting the program up

Install any gems by running the following code:
bundle 

# To use the program

Make sure gems are installed

Run irb (irb -r ./lib/poker.rb  )

# Input

[
  [
    {"suit": "heart", "value": 5},
    {"suit": "heart", "value": 8},
    {"suit": "spade", "value": 1},
    {"suit": "club", "value": 5},
    {"suit": "diamond", "value": 5}
  ],
  [
    {"suit": "club", "value": 1},
    {"suit": "club", "value": 3},
    {"suit": "club", "value": 8},
    {"suit": "club", "value": 9},
    {"suit": "club", "value": 11}
  ],
  [
    {"suit": "diamond", "value": 2},
    {"suit": "heart", "value": 2},
    {"suit": "spade", "value": 2},
    {"suit": "club", "value": 6},
    {"suit": "diamond", "value": 12}
  ],
  [
    {"suit": "club", "value": 2},
    {"suit": "heart", "value": 3},
    {"suit": "spade", "value": 5},
    {"suit": "club", "value": 4},
    {"suit": "diamond", "value": 1}
  ]
]

# OutPut
Ranking 1
{"suit"=>"club", "value"=>1}
{"suit"=>"club", "value"=>3}
{"suit"=>"club", "value"=>8}
{"suit"=>"club", "value"=>9}
{"suit"=>"club", "value"=>11}
Ranking 2
{"suit"=>"club", "value"=>2}
{"suit"=>"heart", "value"=>3}
{"suit"=>"spade", "value"=>5}
{"suit"=>"club", "value"=>4}
{"suit"=>"diamond", "value"=>1}
Ranking 3
{"suit"=>"heart", "value"=>5}
{"suit"=>"heart", "value"=>8}
{"suit"=>"spade", "value"=>1}
{"suit"=>"club", "value"=>5}
Ranking 4
{"suit"=>"diamond", "value"=>2}
{"suit"=>"heart", "value"=>2}
{"suit"=>"spade", "value"=>2}
{"suit"=>"club", "value"=>6}
{"suit"=>"diamond", "value"=>12}
