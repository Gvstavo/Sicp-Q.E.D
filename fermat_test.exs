defmodule Math do


	def expmod(_base , exp , _m) when exp == 0, do: 1

	def expmod(base , exp , m),  do:  base |> :math.pow(exp) |> Kernel.trunc |> Integer.mod(m)

	def fermat_test(n), do: 
			1..n-1
			|> Enum.to_list
			|> Enum.random
			|> try_it(n)

	defp try_it(a,n), do:
		a
		|> Math.expmod(n,n)		
		|> Kernel.==(a)


	
end