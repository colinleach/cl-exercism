class School
  def initialize
    @grades = Hash([])
  end

  def add(name, grade_num)
    return false if roster.include? name
    if @grades.has_key?(grade_num)
      @grades[grade_num].push(name)
    else
      @grades[grade_num] = [name]
    end
    true
  end

  def roster
    names = []
    @grades.keys.sort!.each do |g|
      names += @grades[g].sort
    end
    names
  end

  def grade(grade_num)
    @grades.has_key?(grade_num) ? @grades[grade_num].sort : []
  end
end
