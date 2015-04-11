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
card[0].print
card[1] = LightLineCard.new("2", {:yellow => [:b1, :b2], :green => [:f2, :a1], :blue => [:e1, :e2], :red => [:a2, :f1]})
card[1].print
card[2] = LightLineCard.new("3", {:yellow => [:b1, :b2], :green => [:c1, :a2], :blue => [:e1, :e2], :black => [:a1, :c2]})
card[2].print
card[3] = LightLineCard.new("4", {:yellow => [:e2, :b2], :green => [:d2, :f1], :blue => [:a1, :c2], :black => [:a2, :e1]})
card[3].print
card[4] = LightLineCard.new("5", {:yellow => [:d2, :f1], :black => [:e2, :b2], :blue => [:a2, :e1], :red => [:c2, :a1]})
card[4].print
card[5] = LightLineCard.new("6", {:yellow => [:e1, :e2], :green => [:d1, :f2], :blue => [:c1, :a2], :black => [:b1, :b2]})
card[5].print
card[6] = LightLineCard.new("7", {:yellow => [:a1, :c2], :black => [:b1, :b2], :blue => [:c1, :a2], :red => [:e1, :e2]})
card[6].print
card[7] = LightLineCard.new("8", {:black => [:f1, :a2], :green => [:a1, :c2], :blue => [:b1, :f2], :red => [:b2, :e2]})
card[7].print
card[8] = LightLineCard.new("9", {:yellow => [:e2, :b2], :green => [:b1, :f2], :black => [:a1, :c2], :red => [:a2, :f1]})
card[8].print
card[9] = LightLineCard.new("10", {:yellow => [:d2, :b2], :black => [:b1, :e1], :blue => [:c1, :a2], :red => [:a1, :e2]})
card[9].print
card[10] = LightLineCard.new("11", {:yellow => [:e2, :c2], :black => [:b1, :e1], :blue => [:d2, :b2], :red => [:f2, :d1]})
card[10].print
card[11] = LightLineCard.new("12", {:black => [:f1, :d2], :green => [:c2, :a1], :blue => [:b2, :e2], :red => [:e1, :a2]})
card[11].print
