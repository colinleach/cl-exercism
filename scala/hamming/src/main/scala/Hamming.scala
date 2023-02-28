object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = {
      if (dnaStrandOne.length() == dnaStrandTwo.length()) {
        val pairs = dnaStrandOne.toCharArray() zip dnaStrandTwo.toCharArray()
        val matches = pairs.filter { case (a, b) => a != b }
        Some(matches.length)
      }
      else None
    }
}
