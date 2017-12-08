require 'set'
input = File.read(ARGV[0]).lines

parents = Set.new
children = Set.new
Nodes = Hash.new{|h,k| h[k] = []}
Weights = {}

input.each do |line|
  parent, weight, _, *childs = line.split
  weight = weight.gsub(/[\(\)]/, '').to_i

  Weights[parent] = weight.to_i

  if line.include?("->")
    childs = childs.join.split(',')
    parents.add(parent)

    childs.each do |c|
      children.add(c)
    end

    Nodes[parent] = childs
  else
    children.add parent
  end
end

puts "Part 1. Parent that is never a child:"
root = (parents - children).to_a.first
puts root

puts "-----"
puts "Part 2"

def get_weight(node)
  return Weights[node] + Nodes[node].map{|n| get_weight(n)}.inject(:+).to_i
end

puts "#{root} => #{Nodes[root]}"
current = root
previous = nil

loop do
  puts "Current: #{current}"
  puts "Previous: #{previous}"
  p Nodes[current]

  weights = Nodes[current].map{|n| get_weight(n)}
  weight_count = weights.inject({}) do |count, w|
    if count[w]
      count[w] += 1
    else 
      count[w] = 1
    end
    count
  end
  
  p weights

  weight_count.each_pair do |k,v|
    if v == 1
      previous = {:node => current, :weights => weights}
      current = Nodes[current][weights.index(k)]
    end
  end

  if weight_count.length == 1
    puts "Incorrect weight is: #{current} (#{Weights[current]})"
    puts "Previous was #{previous}"
    diff = previous[:weights].max - previous[:weights].min

    puts "Diff: #{diff}"
    puts "#{current} => #{Weights[current] - diff}"
    break
  end
end


