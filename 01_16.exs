import  Integer

defmodule Math do

	def fast_expt_iter(b , n)  when n == 1, do:  b


	def fast_expt_iter(b , n) , do:  b |> fast_expt_iter(n,1)


	def fast_expt_iter(_b , n , ret) when n == 1 , do: ret

	def fast_expt_iter(b , n , ret) when is_even(n), do:
		b
		|> fast_expt_iter(Integer.floor_div(n , 2) , ret * b * b)

	def fast_expt_iter(b , n , ret) , do:
		b
		|> fast_expt_iter(n - 1 , ret * b) 

end





Math.fast_expt_iter(2,5)