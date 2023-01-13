class Hamming {
  static compute(first, second) {
    if (first.count != second.count) Fiber.abort("strands must be of equal length")
  
    var result = 0
    if (first != "") {
      for (i in 0..first.count-1) {
        if (first[i] != second[i]) result = result + 1 
      }
    }
    return result
  }
}