
input = File.read(ARGV[0]).chomp.chars

state = []
depth = 0
output = ""
garbage_count = 0

input.length.times do |c|
  char = input[c]

  puts "#{state.last} (#{depth}): #{char}"

  case state.last
  when nil
    output << char

    case char
    when '{'
      state.push :in_group
      depth += 1
    when ','
      puts 'next group'
    else 
      raise "invalid character not in group: #{char}"
    end

  when :in_group
    case char
    when '}'
      output << char
      state.pop
      depth -= 1
    when '{'
      output << char
      state.push :in_group
      depth += 1
    when '<'
      state.push :in_garbage
    when ','
      puts "next group"
    else
      raise "invalid character in group: #{char}"
    end

  when :in_garbage
    case char
    when '>'
      state.pop
    when '!'
      state.push :ignore
    else
      garbage_count += 1
    end

  when :ignore
    state.pop
    next
  else
    raise "Unknown state: #{state.last}"
  end

end

puts output

score = 0
total = 0
output.chars.each do |c|
  case c
  when '{'
    score += 1
  when '}'
    total += score 
    score -= 1
  end
end

puts "Total score:"
puts total

puts "Garbage count:"
puts garbage_count



