#
# Manhattan distance for memory cells in a spiral grid
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
#
# number n is in a NxN rectangle where
# N is Ceiling(SQRT(n))
#
# odd number arrays have the 1 centered in the middle
# even number arrays have it off to the left
#
#   In a 3x3 array, the numbers around the outside go from 9
#   down to SQRT(9)-1 because it's odd?
#
# input = 265149
#
#

input = ARGV[0].to_i
size = Math.sqrt(input).ceil
if size.even?
  size = size + 1
end
ring = (size + 1) / 2
max = size * size
min = (size-2)**2 + 1
center = size/2

puts "Inside #{size} x #{size} array."
puts "This is Ring \##{ring}"
puts "Numbers are from #{max} down to #{min}"
puts "Row center is at position: #{center}"

# bottom right corner is max
bottom_row = (max-(size-1)..max)
left_edge = ((bottom_row.first-size+1)..(bottom_row.first))
top_edge = ((left_edge.first-size+1)..(left_edge.first))
right_edge = ((top_edge.first-size+2)..(top_edge.first)).to_a.reverse << 25

puts "Top edge  : #{top_edge.to_a.reverse}"
puts "Right edge: #{right_edge.to_a}"
puts "Bottom row: #{bottom_row.to_a}"
puts "Left edge : #{left_edge.to_a}"

# look for the number in each edge
top_ix = top_edge.to_a.find_index(input)
rit_ix = right_edge.to_a.find_index(input)
lft_ix = left_edge.to_a.find_index(input)
bot_ix = bottom_row.to_a.find_index(input)

offset = (top_ix - center).abs unless top_ix.nil?
offset = (rit_ix - center).abs unless rit_ix.nil?
offset = (lft_ix - center).abs unless lft_ix.nil?
offset = (bot_ix - center).abs unless bot_ix.nil?

puts "offset: #{offset}"

puts "Manhattan Distance = ring + offset - 1 = #{ring} + #{offset} = #{ring+offset-1}"
