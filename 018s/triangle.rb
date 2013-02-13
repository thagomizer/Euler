require 'pp'

class Triangle
  def initialize(filename)
    @rows = []
    @filename = filename
  end

  def print
    pp @rows
  end

  def populate_rows
    File.open @filename do |f|
      lines = f.readlines

      line_count = lines.length
      line_count.times{|x| @rows[x] = []}

      i = line_count - 1
      lines.reverse.each_with_index do |line, index|
        line.split(" ").each_with_index do |n, num_index|
          cell = TriangleCell.new
          cell.value = n.to_i

          if index == 0
            cell.max = n.to_i
          else
            cell.left  = @rows[i + 1][num_index]
            cell.right = @rows[i + 1][num_index + 1]
            cell.max = n.to_i + [cell.left.max, cell.right.max].max
          end
          @rows[i][num_index] = cell
        end
        i -= 1
      end
    end
  end

  def find_max
    populate_rows if @rows.empty?
    @rows[0][0].max
  end

  class TriangleCell
    attr_accessor :value, :left, :right, :max

    def inspect
#      "#{self.value} l: #{self.left} r: #{self.right}"
#      "#{self.value}-#{self.max}"
    end
  end
end
