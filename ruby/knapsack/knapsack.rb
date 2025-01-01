class Knapsack
  def initialize(maximum_weight)
    @maximum_weight = maximum_weight
  end

  def max_value(items) # : Array(NamedTuple(weight: Int32, value: Int32)))
    return 0 if items.empty?

    @num_items = items.size
    @maxes = []
    row = Array.new((@maximum_weight + 1), 0)
    @maxes << row
    (1..@num_items).each do |item_count|
      row = [0]
      curr_weight = items[item_count - 1].weight
      (1..@maximum_weight).each do |weight|
        prev_row = @maxes[-1][weight]
        if curr_weight > weight
          row << prev_row
        else
          replace_last = @maxes[-1][weight - curr_weight] +
            items[item_count - 1].value
          row << [prev_row, replace_last].max
        end
      end
      @maxes << row
    end
    @maxes[-1][-1]
  end
end
