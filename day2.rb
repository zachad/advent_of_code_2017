cksum = 0

File.read(ARGV[0]).lines.each do |line|
  row = line.split.map{|n| n.to_i}
  max = row.max
  min = row.min

  cksum += (max-min)
end

puts cksum
