module ListOps(T)
  # Write your code for the 'List Ops' exercise in this file.

  def self.append(list1 : Array(T), list2 : Array(T)) : Array(T)
    result = [] of T
    list1.each do |entry|
      result << entry
    end
    list2.each do |entry|
      result << entry
    end
    result
  end

  def self.concat(lists : Array(Array(T)))
    result = [] of T
    lists.each do |listn|
      listn.each do |entry|
        result << entry
      end
    end
    result
  end

  def self.filter(list : Array(T), function : T -> Bool) : Array(T)
    result = [] of T
    list.each do |entry|
      if function.call(entry)
        result << entry
      end
    end
    result
  end

  def self.length(list : Array(T)) : Int
    count = 0
    list.each do |_|
      count += 1
    end
    count
  end

  def self.map(list : Array(T), function : T -> _)
    result = [] of T
    list.each do |entry|
      result << function.call(entry)
    end
    result
  end

  def self.foldl(list : Array(T), initial : _, function : _, T -> _)
    result = initial
    list.each do |entry|
      result = function.call(result, entry)
    end
    result
  end

  def self.foldr(list : Array(T), initial : _, function : _, T -> _)
    rev = self.reverse(list)
    self.foldl(rev, initial, function)
  end

  def self.reverse(list : Array(T)) : Array(T)
    result = [] of T
    while list.size > 0
      result << (list.pop)
    end
    result
  end
end
