input = File.read(ARGV[0]).split(",").map(&:to_i)

skip = 0
arr = (0..255).to_a
curr = 0

p input
p arr

def twist(array, start, length)
  ret = array.slice(start, length)

  if ret.size != length
    ret += array.slice(0, length - ret.size)
  end

  ret.reverse!

  ix = start
  ret.each do |r|
    ix = ix % array.length
    puts "setting array[#{ix}] = #{r}"
    array[ix] = r
    ix += 1
  end

  array
end

input.each do |i|
  puts "---"
  p arr
  puts "Input: #{i}"
  puts "Current=#{curr}"

  arr = twist(arr, curr, i)

  curr = (curr + i + skip) % arr.length
  skip += 1
end
p arr

puts "First two elements: #{arr[0]} x #{arr[1]} = #{arr[0] * arr[1]}"
