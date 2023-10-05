class JuiceMaker
    @fluid : Int32

    def initialize(amount_of_juice)
        @running = false
        @fluid = amount_of_juice
    end

    def self.debug_light_on?()
        true
    end

    def start()
        @running = true
    end

    def running?()
        @running
    end

    def add_fluid(amount)
        @fluid += amount
    end

    def stop(minutes)
        @running = false
        @fluid -= 5 * minutes
        @fluid
    end
end
