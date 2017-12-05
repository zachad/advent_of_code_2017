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

puts "Part 2:"
counter = 0 

input.each do |line|
  reject = false

  words = line.split

  words.each_with_index do |w, ix|
    permutations = w.split("").permutation.to_a.map{|aa| aa.join}

    range = (ix+1..-1)
    next if words.slice(range).empty?

    permutations.each do |per|
      #puts "matching word #{ix}: #{per} against #{words.slice(range)}"
      
      found = words.slice(range).index(per)

      if found != nil
        #puts "Found duplicate: #{per} at #{found}: #{words[found]}"
        reject = true
      end
      
    end
  end


  counter += 1 unless reject
end

puts counter
