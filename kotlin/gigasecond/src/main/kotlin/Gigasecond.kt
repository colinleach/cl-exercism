import java.time.LocalDateTime
import java.time.LocalDate

class Gigasecond(val olddate: LocalDateTime) {
    constructor(olddate: LocalDate) : this(olddate.atStartOfDay())
    val date: LocalDateTime = olddate.plusSeconds(1_000_000_000)
}

