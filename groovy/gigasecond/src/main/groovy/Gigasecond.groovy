import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond {

    static def add(LocalDate moment) {
        LocalDateTime start = moment.atStartOfDay()
        start.plusSeconds(1_000_000_000)
    }

    static def add(LocalDateTime moment) {
        moment.plusSeconds(1_000_000_000)
    }

}