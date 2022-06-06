class Array
    def my_each(&prc)
        i = 0
        while i < self.length
        prc.call(self[i])

        i += 1
        end
        self
    end
   
    def my_select(&blk)
        arr = []
        self.my_each{|ele| arr << ele if blk.call(ele)}
        return arr
    end

    def my_reject(&blk)
        arr = []
        self.my_each{|ele| arr << ele if !blk.call(ele)}
        arr
    end

    def my_any?(&blk)
        self.my_each{|ele| return true if blk.call(ele)}
        false 
    end

    def my_all?(&blk)
        self.my_each{|ele| return false if !blk.call(ele)}
        true
    end

    def my_flatten
        result = []
        return [self] if !self.kind_of?(Array)
        
        self.each do |ele|
            if ele.kind_of?(Array)
                result += ele.my_flatten
            else  
                result << ele
            end
        end
        result
    end

    def my_zip(*args)
        result = Array.new(self.length){[]}
        self.each_with_index do |ele, idx|
            result[idx] << ele
            args.each do |arg|
                result[idx] << arg[idx]
            end
        end
        return result
    end

    def my_rotate(num = 1)
        newarr = self.dup
        if num > 0
            num.times do
            newarr << newarr.shift
            end
        elsif num < 0
            num.abs.times do
                newarr.unshift(newarr.pop)
            end
        end
        newarr
    end

    def my_join(sep = "")
        self.join(sep)

    end

    def my_reverse
        self.reverse
    end
    
        

end
