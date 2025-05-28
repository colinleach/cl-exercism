class KindergartenGarden
  def initialize(input : String)
    @diagram = input
    @students = ["Alice", "Bob", "Charlie", "David",
                  "Eve", "Fred", "Ginny", "Harriet",
                  "Ileana", "Joseph", "Kincaid", "Larry"]
    @rows = @diagram.split("\n")
    @species = {'G'=> "grass", 'C'=> "clover", 'R'=> "radishes", 'V'=> "violets"}
  end

  def plants(student : String)
    start = @students.index(student).to_s.to_i * 2
    owns = @rows[0][start..(start + 1)] + @rows[1][start..(start + 1)]
    owns.each_char.map {|p| @species[p]}.to_a
  end
end
