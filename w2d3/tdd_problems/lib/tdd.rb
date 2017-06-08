class Array
  def my_uniq
    result = []
    each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    each_index do |i1|
      ((i1 + 1)...length).each do |i2|
        result << [i1, i2] if (self[i1] + self[i2]).zero?
      end
    end
    result
  end

  def my_transpose
    result = []
    each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        result[idx2][idx] = el
      end
    end
    result
  end

  def stock_picker
    result, max_profit = [], 0
    each_index do |buy_date|
      each_index do |sell_date|
        next if buy_date >= sell_date
        profit = self[sell_date] - self[buy_date]
        if profit > max_profit
          max_profit = profit
          result = [buy_date, sell_date]
        end
      end
    end
    result
  end

end
