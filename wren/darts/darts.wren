class Darts {
  static score(x,y) {
    var r_sq = x * x + y * y
    if (r_sq <= 1) return 10
    if (r_sq <= 25) return 5
    if (r_sq <= 100) return 1
    return 0
  }
}