# Definition for a  binary tree node
# class TreeNode
#     attr_accessor :left,:right,:data
#     def initialize(data)
#         @data = data
#         @left = nil
#         @right = nil
#     end
# end
class Solution
    # @param a : root node of tree
    # @return an integer
    def initialize
        @res = -1000000
    end
    
    def maxPathSum(a)
        maxPathSumHelper(a)
        @res
    end
    
    def maxPathSumHelper(root)
        
        return 0 if root.nil?
        
        left = maxPathSumHelper(root.left)
        right = maxPathSumHelper(root.right)
        
        max_single = [[left,right].max + root.data, root.data].max
        max_top = [max_single, left+right+root.data].max
        
        @res = [@res,max_top].max
        return max_single
    end
end
