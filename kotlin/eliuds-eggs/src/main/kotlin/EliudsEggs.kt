object EliudsEggs {

    fun eggCount(number: Int): Int{
        var count = 0
        var num = number
        while (num != 0) {
            if (num and 1 > 0) count++
            num = num shr 1
        }
        return count
    }
}
