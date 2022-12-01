input = File.read("./1-input.txt")

max_calories = input.split("\n\n").map do |line|
  line.split("\n").map(&:to_i).sum
end.max

puts max_calories
