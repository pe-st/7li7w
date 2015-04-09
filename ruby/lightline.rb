# Define the 12 cards of the game "Light Line" (Jörg Domberger)
#
# Cards have 3 connectors on each side:
#
#    +--[a0]--[b0]--[c0]--+
#    |                    |
#   [f1]                [d0]
#    |                    |
#   [e1]                [e0]
#    |                    |
#   [d1]                [f0]
#    |                    |
#    +--[c1]--[b1]--[a1]--+
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
