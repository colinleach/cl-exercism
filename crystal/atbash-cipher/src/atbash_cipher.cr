class AtbashCipher
    @@plain : Array(Char) = ('a'..'z').to_a
    @@cipher : Array(Char) = @@plain.reverse
    @@digits : Array(Char) = ('0'..'9').to_a

    def self.p2c(chr : Char)
        if @@digits.includes?(chr)
            return chr.to_s
        end

        inx = @@plain.index(chr)
        inx ? @@cipher[inx.to_i].to_s : ""
     end

    def self.c2p(chr)
        if @@digits.includes?(chr)
            return chr.to_s
        end

        inx = @@cipher.index(chr)
        inx ? @@plain[inx.to_i].to_s : ""
    end

    def self.group_by_5(raw : String)
        raw.size <= 5 ? raw : raw[...5] + " " + group_by_5(raw[5..])
    end

    def self.encode(input)
        raw = (input.downcase.chars.map() { |chr| p2c(chr) }).join()
        group_by_5(raw)
    end

    def self.decode(input)
        (input.downcase.chars.map() { |chr| c2p(chr) }).join()
     end

end