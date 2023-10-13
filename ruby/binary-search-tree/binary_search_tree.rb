class Bst
  attr_accessor :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    if value <= data
      @left = @left.nil? ? Bst.new(value) : @left.insert(value)
    else
      @right = @right.nil? ? Bst.new(value) : @right.insert(value)
    end
    self
  end

  def each(&block)
    return self.to_enum if block.nil?

    @left.each { |val| yield val } if @left
    yield data
    @right.each { |val| yield val } if @right
  end
end
