class Solution
    # @param a : array of array of integers
    # @return an integer
    def adjacent(a)
        
        return 0 if a.nil? || a.length == 0 || a[0].length == 0

        n = a[0].length
        # memoization array
        maxSums = [n]
        
        # first column, base case
        maxSums[0] = [a[0][0], a[1][0]].max
        
        #first quad (2 columns)
        if n > 1
            maxSums[1] = [maxSums[0],a[0][1], a[1][1]].max
        end
        
        #more than 2columns
        if n > 2
            for i in 2...n
                intermediate = [a[0][i], a[1][i]].max
                maxSums[i] = [maxSums[i-1], intermediate + maxSums[i-2]].max
            end
        end
        
        return maxSums[-1]
    end
end
