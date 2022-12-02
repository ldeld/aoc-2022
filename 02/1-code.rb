# A, X = Rock = 1p
# B, Y = Paper = 2p
# C, Z = Scissors = 3p

HANDS = {
  A: { points: 1, beats: :Z },
  B: { points: 2, beats: :X },
  C: { points: 3, beats: :Y },
  X: { points: 1, beats: :C },
  Y: { points: 2, beats: :A },
  Z: { points: 3, beats: :B }
}

input = File.read("./1-input.txt")

result = input.split("\n").reduce(0) do |sum, round|
  opp, you = round.split(' ').map(&:to_sym)
  round_score = HANDS[you][:points]
  if HANDS[you][:beats] == opp # win
    round_score += 6
  elsif HANDS[opp][:beats] != you # tie
    round_score += 3
  end
  sum + round_score
end

puts result
