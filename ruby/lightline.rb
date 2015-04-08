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
  attr_accessor :card_name, :a, :b, :c, :d, :e, :f

  def initialize(name)
    @card_name = name
    @a = [nil, nil]
    @b = [nil, nil]
    @c = [nil, nil]
    @d = [nil, nil]
    @e = [nil, nil]
    @f = [nil, nil]
  end

  def print
    puts "         #{@a[0]} #{@b[0]} #{@c[0]}"
    puts "#{@f[1]}                             #{@d[0]}"
    puts "#{@e[1]}                             #{@e[0]}"
    puts "#{@d[1]}                             #{@f[0]}"
    puts "         #{@c[1]} #{@b[1]} #{@a[1]}"
  end

end

card = []
card[0] = LightLineCard.new("1")
card[0].b[0] = :yellow
card[0].b[1] = :yellow
card[0].c[0] = :green
card[0].a[1] = :green
card[0].e[0] = :blue
card[0].e[1] = :blue
card[0].c[1] = :red
card[0].d[1] = :red
card[0].print
