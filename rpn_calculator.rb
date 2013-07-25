class RPNCalculator
	def initialize
		@stack = []
	end
	def push(num)
		@stack << num
	end
	def plus
		begin
			sum = @stack.pop+@stack.pop
		rescue
			raise 'calculator is empty'
		else
			@stack << sum
		end
	end
	def minus
		begin
			n1 = @stack.pop
			n2 = @stack.pop
			dif = n2 - n1
		rescue
			raise 'calculator is empty'
		else
			@stack << dif
		end
	end
	def times
		begin
			prod = @stack.pop*@stack.pop
		rescue
			raise 'calculator is empty'
		else
			@stack << prod
		end
	end
	def divide
		begin
			if @stack.size < 2
				n1 = @stack.pop#.to_f
				n2 = @stack.pop#.to_f
			else
				n1 = @stack.pop.to_f
				n2 = @stack.pop.to_f
			end
			quo = n2 / n1
		rescue
			raise 'calculator is empty'
		else
			@stack << quo
		end
	end
	def value
		return @stack[-1]
	end
#extra credit
	def tokens (input)
		tks = input.split " "
		tks.map! do |item|
			if /^[\d]+(\.[\d]+){0,1}$/ === item
				then item.to_i
			else
				item.to_sym
			end
		end
		return tks
	end
# extra credit
#	def evaluate (input)
#	end
end