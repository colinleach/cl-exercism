object CollatzConjecture {
    def steps(n: Int): Option[Int] = {
        if (n > 0) Some(step(n, 0))
        else None
    }

    def step (n: Int, stepcount: Int): Int = {
        if (n == 1) 
            stepcount
        else {
            val newnum: Int = if (n % 2 == 0) n / 2 else 3 * n + 1
            step(newnum, stepcount + 1)
        }
    }
}