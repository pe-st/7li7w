# Define the 12 cards of the game "Light Line" (Jörg Domberger)
#
# Cards have 3 connectors on each side:
#
#    +--[a1]--[b1]--[c1]--+
#    |                    |
#   [f2]                [d1]
#    |                    |
#   [e2]                [e1]
#    |                    |
#   [d2]                [f1]
#    |                    |
#    +--[c2]--[b2]--[a2]--+
#
# For every card exist connections between two connectors
# in 4 colours out of 5 (yellow, red, blue, green, black).
#

class LightLineCard
  attr_accessor :card_name, :connectors
  COLORS = [:yellow, :red, :blue, :green, :black]

  def initialize(name, connections = {})
    @card_name = name
    @connectors = {}

    COLORS.each do |c|
      unless connections[c] == nil
        connectors[ connections[c][0] ] = c
        connectors[ connections[c][1] ] = c
      end
    end
  end

  def print
    puts '=' * 20 + " #{@card_name} " + '=' * 20
    puts "         |#{@connectors[:a1]}| |#{@connectors[:b1]}| |#{@connectors[:c1]}|"
    puts "|#{@connectors[:f2]}|                             |#{@connectors[:d1]}|"
    puts "|#{@connectors[:e2]}|                             |#{@connectors[:e1]}|"
    puts "|#{@connectors[:d2]}|                             |#{@connectors[:f1]}|"
    puts "         |#{@connectors[:c2]}| |#{@connectors[:b2]}| |#{@connectors[:a2]}|"
  end

end

card = []
card[0] = LightLineCard.new("1", {:yellow => [:b1, :b2], :green => [:c1, :a2], :blue => [:e1, :e2], :red => [:c2, :d2]})
card[1] = LightLineCard.new("2", {:yellow => [:b1, :b2], :green => [:f2, :a1], :blue => [:e1, :e2], :red => [:a2, :f1]})
card[2] = LightLineCard.new("3", {:yellow => [:b1, :b2], :green => [:c1, :a2], :blue => [:e1, :e2], :black => [:a1, :c2]})
card[3] = LightLineCard.new("4", {:yellow => [:e2, :b2], :green => [:d2, :f1], :blue => [:a1, :c2], :black => [:a2, :e1]})
card[4] = LightLineCard.new("5", {:yellow => [:d2, :f1], :black => [:e2, :b2], :blue => [:a2, :e1], :red => [:c2, :a1]})
card[5] = LightLineCard.new("6", {:yellow => [:e1, :e2], :green => [:d1, :f2], :blue => [:c1, :a2], :black => [:b1, :b2]})
card[6] = LightLineCard.new("7", {:yellow => [:a1, :c2], :black => [:b1, :b2], :blue => [:c1, :a2], :red => [:e1, :e2]})
card[7] = LightLineCard.new("8", {:black => [:f1, :a2], :green => [:a1, :c2], :blue => [:b1, :f2], :red => [:b2, :e2]})
card[8] = LightLineCard.new("9", {:yellow => [:e2, :b2], :green => [:b1, :f2], :black => [:a1, :c2], :red => [:a2, :f1]})
card[9] = LightLineCard.new("10", {:yellow => [:d2, :b2], :black => [:b1, :e1], :blue => [:c1, :a2], :red => [:a1, :e2]})
card[10] = LightLineCard.new("11", {:yellow => [:e2, :c2], :black => [:b1, :e1], :blue => [:d2, :b2], :red => [:f2, :d1]})
card[11] = LightLineCard.new("12", {:black => [:f1, :d2], :green => [:c2, :a1], :blue => [:b2, :e2], :red => [:e1, :a2]})
#card[11].print

# create all possible layouts with these 12 cards
# - first create generic layouts (12 connected places) without assigning the cards,
# - then do all permutations

# layout options:
# - create 12x12 grids and fill them systematically with 12 cards, then sort out the invalid ones.
# - Or start with one card and attach the other cards step by step in directions right/left/up/down
#   - to avoid multiple identical solutions: define the start card as the bottom left card,
#     that is the most left card on the bottom row
#   - use a..v on the x-axis and 0..11 on the y-axis, the start card is on k0
#     11
#     10
#      9
#      8
#      7
#      6
#      5
#      4
#      3
#      2
#      1
#      0          X***********  (this is the layout "k0l0m0n0o0p0q0r0s0t0u0v0")
#       abcdefghijklmnopqrstuv
#   - every layout is easily identified with the string of its coordinate pairs alphabetically sorted, e.g.
#     the simplest layout for all cards on one line would be "k0l0m0n0o0p0q0r0s0t0u0v0",
#     tho one with all cards in one column "k0k1k2k3k4k5k6k7k8k9k10k11"
#
# cards layouts
#     1       1
#     2       2
#     3       6
#     4      19
#     5      63
#     6     216
#     7     760
#     8    2725
#     9    9910  (took  18s)
#    10   36446  (took 279s)
#    11
#    12

NUMBER_OF_CARDS = 10

require 'set'
$layoutset = Set.new

def test_place(cards, coords)
  # puts "test_place #{cards} #{coords}"
  return false if coords[1] < '0'
  return false if coords[1] == '0' && coords[0] < 'k'
  # puts coords.join
  return false if cards.include? coords.join
  # puts "#{coords.join} is ok"
  return true
end


def find_possible_places(cards)
  candidates = Set.new

  cards.each do |card_place|
    coords = card_place.chars
    left = [(coords[0].ord-1).chr, coords[1]]
    right = [(coords[0].ord+1).chr, coords[1]]
    up = [coords[0], (coords[1].ord+1).chr]
    down = [coords[0], (coords[1].ord-1).chr]
    candidates.add(left.join) if test_place(cards, left)
    candidates.add(right.join) if test_place(cards, right)
    candidates.add(up.join) if test_place(cards, up)
    candidates.add(down.join) if test_place(cards, down)
  end

  return candidates.to_a
end

# recursive function: finds all valid places for the next card and tries each of them recursively
def layouts(cards, remaining)
  # puts "#{remaining}: #{cards}"
  if remaining > 0
    valid_places = find_possible_places(cards)
    # puts "valid places: #{valid_places}"
    valid_places.each do |place|
      cards_copy = cards.map {|e| e.dup}
      layouts(cards_copy.push(place), remaining - 1)
#      layouts(cards.sort.push(place), remaining - 1)
    end
  else
    # end the recursion, put the result in the set
    layout_id = cards.sort.inject("") {|s, place| s + place}
    $layoutset.add(layout_id)
    # puts "#{layout_id}, total #{$layoutset.size} layouts"
  end
end

layouts(["k0"], NUMBER_OF_CARDS - 1)
puts $layoutset.size

