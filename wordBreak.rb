class Solution
    # @param a : string
    # @param b : array of strings
    # @return an integer
    def wordBreak(a, b)

        state = [a.length+1]
        state[0] = true
  
        for i in (0...a.length)
            next if !state[i]
            
            b.each do |word|
                len = word.length
                last = i + len
                
                next if last > a.length
                
                state[last] = true if a[i...last] == word
            end
        end
        
        return 1 if state[a.length] == true
        
        return 0
    end
end
