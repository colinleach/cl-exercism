class CircularBuffer
  @buffer_size : Int32
  @buff : Deque(Int32)

  def initialize(@buffer_size)
    @buff = Deque(Int32).new(@buffer_size)
  end

  def read
    raise RuntimeError.new unless @buff.size >= 1
    @buff.shift
  end

  def write(entry)
    raise RuntimeError.new unless @buff.size < @buffer_size
    @buff << entry
  end

  def overwrite(entry)
    @buff.shift if @buff.size == @buffer_size
    write(entry)
  end

  def clear
    @buff.clear
  end
end
