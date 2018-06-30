# 5. Recursividad
```oz
fun {Length Xs}
	case Xs of
		nil then 0
	[] X|Xr then 
		1+{Length Xr}
	end
end
```
Se puede ver en la ejecución en máquina abstracta que por cada llamada recursiva se agrega un statement al stack. Es decir: cuando se llama por última vez a `Length`, con `Xr=nil`, antes de que esta llamada termine, hay un elemento en el stack por cada elemento de la lista `Xs`. En este caso, con `Xs = [1 2 3 4]` habrá 4 statements en el stack, `<s8>`, que corresponden al último statement de cada una de las llamadas recursivas. Esta acumulación de statements en el stack ocurre porque el último statement de `Length` necesita que todas las llamadas recursivas siguientes finalicen para luego seguir ejecutando su `1 + {Length Xr}`. Si la lista fuera muy larga, esto sería realmente ineficiente en memoria, porque eventualmente habría un `<s8>` en el stack por cada elemento de la lista. 

Para evitar esto, hay que reescribir `Length` para que su último statement sea sólo una llamada recursiva, para lo cual hace falta ir pasando un acumulador:
```oz
fun {Length Xs}
	local LengthAux in
		fun {LengthAux Xs Accum}
			case Xs of
			nil
			then Accum
			[] X|Xr then
				local Aux in
					Aux = Accum + 1
					{LengthAux Xr Aux}
				end
		end
	end
	{LengthAux Xs 0}
	end
end
```

Ahora el verdadero "trabajo" lo hace `LengthAux`, mientras que `Length` sólo llama a `LengthAux` con un acumulador inicial de 0. Como se ve en la ejecución paso por paso, cuando en el tope del stack está la llamada recursiva `{LengthAux Xr Aux}`, `<s11>`, se desapila este statement y se apila el contenido de `LengthAux`, `<s7>`, dejando sólo eso en el stack. Es decir, _no_  quedan en el stack statements de llamadas "superiores" o anteriores. Gracias a esto, el stack tendrá un tamaño constante (entre 1 y 2) y no va a crecer de acuerdo al tamaño de la lista, por lo que será mucho más eficiente para listas largas que la primera versión.

Esta optimización, que consiste en realizar los cálculos primero y por último hacer la llamada recursiva, pasándole los resultados parciales, se llama _tail recursion_.
