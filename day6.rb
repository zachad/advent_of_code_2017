#
# day 4
#

banks = File.read(ARGV[0]).split.map(&:to_i)
original = banks.dup
counter = 0
seen = {}

loop do
  if seen[banks.join(",")]
    puts "Loop detected after #{counter}"
    banks = original
    counter = 0
    seen = {}
    seen[banks.join(",")] = true
    sleep 5
  else
    seen[banks.join(",")] = true
  end
  counter += 1

  p banks
  max = banks.max
  max_ix = banks.index(max)
  puts "Maximum at: #{max_ix} is #{max}"

  banks[max_ix] = 0
  max.times do |i|
    banks[(max_ix + i + 1) % banks.length] += 1
  end
end


