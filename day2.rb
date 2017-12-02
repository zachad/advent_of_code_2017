cksum = 0
input = File.read(ARGV[0]).lines

puts "Part 1:"
input.each do |line|
  row = line.split.map{|n| n.to_i}
  max = row.max
  min = row.min

  cksum += (max-min)
end
puts cksum

puts "Part 2:"
cksum = 0
input.each do |line|
  row = line.split.map{|n| n.to_i}.sort.reverse

  stop = false
  p row
  row.each_with_index do |r, ix|
    next if stop

    puts "Checking: #{r}"
    ((ix+1)..(row.length-1)).each do |ixx|
      if (r % row[ixx]) == 0
        division = r / row[ixx]
        cksum += division
        puts "Found: #{row[ixx]} goes in evenly to #{r} #{division} times"
        stop = true
      end
    end
  end
end

puts cksum
