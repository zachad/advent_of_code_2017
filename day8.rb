input = File.read(ARGV[0]).lines

R = Hash.new(0)
max = 0

input.each do |line|
  reg, op, val, _, cond_reg, cmp, cond_val = line.split
  
  val = val.to_i
  cond_val = cond_val.to_i

  op = (op == "inc" ? "+=" : "-=")

  eval "R[\"#{reg}\"] #{op} #{val} if R[\"#{cond_reg}\"] #{cmp} #{cond_val}"

  if R.values.max > max
    max = R.values.max
  end
end

puts "Maximum at end:"
p R.values.max

puts "Maximum during runtime:"
p max
