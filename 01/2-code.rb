input = File.read("./1-input.txt")

calories = input.split("\n\n").map do |line|
  line.split("\n").map(&:to_i).sum
end

puts calories.sort.last(3).sum
