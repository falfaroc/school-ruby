# Takes an unsorted array and returns
# a sorted array using the Heap sort 
# algorithm
class HeapSort
	attr_reader :input
	
	def initialize(arg)
		@input=arg
		@root = 0
	end
	
	def heap_sort
	  heapify
	  the_end=input.length-1
	  heap_sort_loop(the_end)
	  input
	end

	def heap_sort_loop(the_end)
		while the_end > 0
			input[the_end],input[0]=input[0],input[the_end]
			the_end-=1
			shift_down(0,the_end)
			end
	end
	
	def heapify
		input_length = input.length
	    the_start=(input_length-2)/2
	     
	     while the_start >=0 
			shift_down(the_start,input_length-1)
			the_start-=1
	     end
	end
	
	def shift_down(the_start,the_end)
		@root=the_start
		root_length = root_end()
		while root_length <= the_end
			swap = swap_rearrange(swap, root_length, the_end)
			
			if swap!=@root
				input[@root],input[swap]=input[swap],input[@root]
				@root=swap
			else
				return
			end
			root_length = root_end()	
		end
	end

	def swap_rearrange(swap, root_length, the_end)
		child=root_length
		swap=@root
		
		swap = swap_less_than_child(swap, child)
		
		swap = child_plus_one_check(child, the_end, swap)
	end

	def root_end()
		@root * 2 + 1
	end

	def child_plus_one_check(child, the_end, swap)
		child_check = child + 1
		if child_check <= the_end && @input[swap] < @input[child_check]
			swap=child_check
		end
		swap
	end

	def swap_less_than_child(swap, child)
		if input[swap] < input[child]
			swap=child
		end
		swap
	end
	
end