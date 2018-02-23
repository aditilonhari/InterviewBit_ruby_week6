class Solution
  # @param a : array of array of integers
  # @return an integer
  def maximalRectangle(matrix=[])
    
    # d[i][j] - in current row, how many contiguous 1's
    dp = Array.new(matrix.size) { Array.new(matrix[0].size) }
    row = matrix.size-1
    col = matrix[0].size-1
    
    (0..row).each do |i|
      (0..col).each do |j|
        if j == 0
          dp[i][j] = matrix[i][j].to_i
        else
          dp[i][j] = (matrix[i][j] == 0) ? 0 : dp[i][j-1]+1
        end
      end
    end

    max = 0
    (0..row).each do |i|
      (0..col).each do |j|
        unless dp[i][j] == 0
          max = [max, expand(dp, i, j)].max
        end
      end
    end
    max
  end
  
  private

  # What is the longest height based on width of dp[i][j]
  def expand(dp, i, j)
    height = 0
    width = dp[i][j]
    # Up
    i.downto(0).each do |m|
      break if dp[m][j] < width
      height += 1
    end

    # Down
    (i+1..dp.size-1).each do |m|
      break if dp[m][j] < width
      height += 1
    end
    height*width
  end
end
