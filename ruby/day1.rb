# run this script with:
# ruby day1.rb
puts 'hello world'
idx = /Ruby/ =~ 'Hello, Ruby'
puts "index of a substring: #{idx}"

# replacing strings
claim = 'perl, perl, perl is readable'
claim1 = claim.sub('perl', 'ruby')
puts "claim1: #{claim1}"
claim2 = claim.gsub('perl', 'ruby')
puts "claim2: #{claim2}"
puts "original claim: #{claim}"

# loops (while would be simpler...)
for count in 1..10 do
  puts "step #{count}: " + '=' * count
end
