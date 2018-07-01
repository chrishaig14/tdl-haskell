# 8 Hilos
## 8.1 Wait

El procedimiento `WaitSome` recibe una lista de variables `[X Y Z ...]`, y bloquea la ejecución hasta que alguna de ellas se encuentre determinada. Para lograr esto, dentro de `WaitSome` se crea un procedimiento interno `WaitAll` que recursivamente va lanzando un thread por cada variable de la lista, y llama a `Wait` para esa variable. Inmediatamente después de cada `Wait` se asigna un valor (puede ser cualquier valor, pero en este caso es `true`) a la variable `Ok` que es local a `WaitSome`. Por lo tanto `Ok` será determinada justo después de que la primera entre `X`, `Y`, `Z`, ... esté determinada. Luego de lanzar los threads que esperan por cada variable de la lista con `WaitAll`, se espera por `Ok` con  `Wait`.

```oz
   proc {WaitSome Xs}
      local Ok WaitAll in
	 proc {WaitAll Xs}
	    case Xs of
	       H|T then
	       thread {Wait H} Ok = true end
	       {WaitAll T}
	    else
	       skip
	    end
	 end
	 {WaitAll Xs}
	 {Wait Ok}
      end
   end
```

Ejemplo de uso:
```oz
   thread {Delay 20000} X = 1 end
   thread {Delay 30000} Y = 2 end
   thread {Delay 10000} Z = 3 end
   {WaitSome [X Y Z]}
   {Browse 'Ready'}
   {Browse 'X'#X#'Y'#Y#'Z'#Z}
```

Primero se lanza un thread para cada variable `X`, `Y`, `Z`, que asigna un valor a esa variable después de un cierto tiempo.

Al llamar a `WaitSome`, dentro de `WaitAll` se lanzan 3 threads

```oz
thread {Wait X} Ok = true end
```
```oz
thread {Wait Y} Ok = true end
```
```oz
thread {Wait Z} Ok = true end
```

Después de crear estos threads, se llama a `Wait Ok`. Por lo tanto, cuando una de las variables quede determinada, el thread que la esperaba se desbloqueará y asignará un valor a `Ok`, desbloqueando `WaitSome` y continuando con la ejecución de los `Browse` (en este caso, `Z` es la primera variable en tener un valor).

