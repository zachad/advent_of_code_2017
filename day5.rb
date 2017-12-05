
input = File.read(ARGV[0]).lines.map(&:to_i)

cix = 0
steps = 0
loop do
  instr = input[cix]
  input[cix] += 1

  # jump
  cix = cix + instr
  steps += 1

  break if cix >= input.length || cix < 0

end

puts "Part 1"
puts steps

##
## part 2
##
#
input = File.read(ARGV[0]).lines.map(&:to_i)

cix = 0
steps = 0
loop do
  instr = input[cix]

  if instr >= 3
    input[cix] -= 1
  else
    input[cix] += 1
  end

  # jump
  cix = cix + instr
  steps += 1

  break if cix >= input.length || cix < 0

end

puts "Part 2"
puts steps
