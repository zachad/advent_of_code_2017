
input = File.read(ARGV[0]).strip.split("")

sum = 0
input.each_with_index do |num, ix|
  if ix + 1 == input.length
    sum += num.to_i if num == input[0]
  else
    sum += num.to_i if num == input[ix+1]
  end
end

puts "Part 1:"
puts sum

# part 2
# use half-way around calculation
halfway = input.length / 2
sum = 0
input.each_with_index do |num, ix|
  check = (ix + halfway) % input.length

  sum += num.to_i if num == input[check]
end

puts "Part 2:"
puts sum

