class Hamming {

    def distance(strand1, strand2) {
        if (strand1.length() != strand2.length()) throw new ArithmeticException('Unequal length')
        if (strand1 == strand2) return 0

        int distance = 0
        for (int i=0; i<strand1.length(); i++) if (strand1[i] != strand2[i]) distance++
        return distance
    }

}