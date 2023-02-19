object ResistorColor {

    private val codes: List<String> = listOf("black","brown","red","orange","yellow","green","blue","violet","grey","white")

    fun colorCode(input: String): Int {
        return codes.indexOf(input)
    }

    fun colors(): List<String> {
        return codes
    }

}
