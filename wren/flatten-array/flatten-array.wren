class Flatten {
  static flatten(list) {
    var result = []
    for (item in list) {
      if (!item) continue

      if (item is Sequence) {  // recurse
        result = result + flatten(item)
      } else {  // just a number
        result = result + [item]
      }
    }
    return result
  }
}