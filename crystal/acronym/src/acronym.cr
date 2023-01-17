class Acronym
    def self.abbreviate(input)
        wordlist = input.gsub('-', ' ').gsub(/[,.?!_]/, ' ').split(' ')
        letters = wordlist.map() { |word| word[0, 1].capitalize() }
        letters.join()
    end
end
  