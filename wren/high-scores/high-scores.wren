class HighScores {
  construct new(input) {
    _scores = input[0..-1]
  }

  scores = (input) { _scores = input }  

  scores { _scores }
  
  latest { _scores[-1] }

  personalBest {
    var sorted = _scores[0..-1].sort()
    return sorted[-1]
  }

  personalTopThree {
    var sorted = _scores[0..-1].sort {|a, b| a > b}
    return sorted.count > 2 ? sorted[0..2] : sorted
  }
}
