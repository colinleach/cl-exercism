module TicketingReservation
    def tickets_available
        @tickets_available
    end

    def order_ticket?
        if @tickets_available >= 100
            @tickets_available -= 1
            return true
        end
        false
    end

    def order_message(name)
        succeed = "#{name}, your purchase was successful"
        succeed += ", your ticket number is \##{@tickets_available}"
        succeed += ", and the game is played at the #{@stadium} stadium."

        fail = "#{name}, your purchase was unsuccessful, there are not enough tickets available."

        order_ticket? ? succeed : fail
    end
end

class TicketSystem
    include TicketingReservation

    def initialize(@tickets_available : Int64, @stadium : String)
    end
end
