#
# day 4
#

input = File.read(ARGV[0]).lines
counter = 0

input.each do |line|
  hsh = line.split.inject({}) do |count, item|
    if count[item]
      count[item] += 1
    else
      count[item] = 1
    end

    count
  end

  if hsh.values.max == 1
    counter += 1
  end
end
 
puts "Part 1:"
puts counter
