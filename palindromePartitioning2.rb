class Solution
  # @param a : string
  # @return an integer
  def minCut(s='')
    # dp1[i][j] - is s[i..j] palindrome?
    dp1 = Array.new(s.size) { Array.new(s.size, false) }
    (s.size-1).downto(0).each do |i|
      (i..s.size-1).each do |j|
        if s[i] == s[j] && (j-i <= 2 || dp1[i+1][j-1])
          dp1[i][j] = true
        end
      end
    end

    # dp2[i] - min cut between (i..s.size)
    dp2 = Array.new(s.size+1, 0)
    (0..dp2.size-1).each do |i|
      dp2[i] = s.size-i-1 # the worst case is cutting by each char
    end

    (s.size-1).downto(0).each do |i|
      (i..s.size-1).each do |j|
        dp2[i] = [dp2[i], dp2[j+1]+1].min if dp1[i][j]
      end
    end
    dp2[0]
  end
end
