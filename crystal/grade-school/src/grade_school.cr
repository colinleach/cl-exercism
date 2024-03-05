class GradeSchool
  def initialize
    @grades = Hash(Int32, Array(String)).new
  end

  def add(name, grade_num)
    return false if roster().includes?(name)
    if @grades.has_key?(grade_num)
      @grades[grade_num].push(name)
    else
      @grades[grade_num] = [name]
    end
    true
  end

  def roster
    names = Array(String).new
    @grades.keys.sort!.each do |g|
      names += @grades[g].sort
    end
    names
  end

  def grade(grade_num)
    @grades.has_key?(grade_num) ? @grades[grade_num].sort : [] of String
  end
end
