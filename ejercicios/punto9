	9.1

local MyMap L Lout A B C mult in
	MyMap = proc {$ Xs F R}
		local R2 in
			case Xs of 
				nil then R = nil
				[] X|Xr then R = {F X}|{MyMap Xr F R2}
		
			end
		end	
	end
	L = [1 2 3 4]
	proc {mult X R}
		local T in
		 T= proc {$ Y} Y=X*X end
		{ByNeed T Y}
		end
	end
	{MyMap L mult Lout}
	A = Lout.1
	B = Lout.2
	C = A + B
	{Browse C}
end

9.2

La diferencia esta en que la funcion Rev de Reverse2 es Lazy. Como la funcion es monolitica, no es necesario que Rev sea Lazy. Es decir, aunque se necesite solo el primer elemento, se deberan calcular todas las posiciones del array. Por lo cual, el resultado obtenido por las dos funciones es el mismo.
En cuanto a la eficiencia, como las funciones Lazy generan threads, la funcion Reverse2 es menos eficiente.

