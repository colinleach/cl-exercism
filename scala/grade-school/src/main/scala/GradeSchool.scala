class School {
  type DB = Map[Int, Seq[String]]

  private var school: DB = Map.empty

  def add(name: String, g: Int) = 
    {
      if (school.contains(g)) {
        val newSeq: Seq[String] = school(g) :+ name
        school(g) = newSeq
      }
      else school(g) = Seq(name)
    }

  def db: DB = school

  def grade(g: Int): Seq[String] =     
       if (school.contains(g)) school(g) else Seq()

  def sorted: DB = school
}

