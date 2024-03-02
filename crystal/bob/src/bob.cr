module Bob
  QUESTION_RESP = "Sure."
  YELL_RESP = "Whoa, chill out!"
  QYELL_RESP = "Calm down, I know what I'm doing!"
  SILENCE_RESP = "Fine. Be that way!"
  DEF_RESP = "Whatever."

  def self.hey(string : String) : String
    inp = string.strip
    unless inp.size > 0
      return SILENCE_RESP
    end
    is_q? : Bool = inp.ends_with?("?")
    if (inp =~ /[A-Z]/) && ! (inp =~ /[a-z]/)
      return is_q? ? QYELL_RESP : YELL_RESP
    end
    is_q? ? QUESTION_RESP : DEF_RESP
  end
end
