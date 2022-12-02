# A, X = Rock = 1p
# B, Y = Paper = 2p
# C, Z = Scissors = 3p

HANDS = {
  A: { points: 1, beats: :C },
  B: { points: 2, beats: :A },
  C: { points: 3, beats: :B }
}

input = File.read("./1-input.txt")

result = input.split("\n").reduce(0) do |sum, round|
  opp, strategy = round.split(' ').map(&:to_sym)
  if strategy == :X # Lose
    you = HANDS[opp][:beats]
    round_score = 0
  elsif strategy == :Y # Tie
    you = opp
    round_score = 3
  else # win
    you = HANDS.find { |_k, v| v[:beats] == opp }[0]
    round_score = 6
  end

  round_score += HANDS[you][:points]

  sum + round_score
end

puts result
