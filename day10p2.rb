input = File.read(ARGV[0]).strip.each_byte.map(&:to_i)

skip = 0
curr = 0
arr = (0..255).to_a

input += [17, 31, 73, 47, 23]
p input

def twist(array, start, length)
  ret = array.slice(start, length)

  if ret.size != length
    ret += array.slice(0, length - ret.size)
  end

  ret.reverse!

  ix = start
  ret.each do |r|
    ix = ix % array.length
#    puts "setting array[#{ix}] = #{r}"
    array[ix] = r
    ix += 1
  end

  array
end

64.times do
  p arr
  input.each do |i|
    #puts "---"
    #p arr
    #puts "Input: #{i}"
    #puts "Current=#{curr}"

    arr = twist(arr, curr, i)

    curr = (curr + i + skip) % arr.length
    skip += 1
  end
end

sparse = arr

p sparse 
dense = sparse.each_slice(16).map do |sp|
  sp.inject(:^)
end

p dense

p dense.map{|d| "%02x" % d}.join

