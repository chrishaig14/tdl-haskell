# 12. Celdas de memoria
```oz
declare
	X={NewCell 0}
	{Assign X 5}
	Y=X
	{Assign Y 10}
	{Browse {Access X}==10}
	{Browse X==Y}
	Z={NewCell 10}
	{Browse Z==Y}
	{Browse @X==@Z}
```
Al hacer por ejemplo `A = {NewCell 0}`, `A`  es una es una referencia a una celda de memoria. El contenido de esa celda puede ser modificado con `Assign`, por ejemplo `{Assign A 1}`. Ahora, en verdad `A` no cambia, lo que cambia es el _contenido_ de esa celda (puede pensarse que `A` es un puntero, que no cambia nunca, a una posición de memoria). Para acceder a ese contenido se utiliza `{Access A}`, o bien `@A`.

Teniendo en cuenta esto vemos que en el código de arriba:

1. Se crea la celda `X` con valor inicial 0.
2. Se asigna a `X` el valor 5.
3. Se iguala `Y` a `X`. A partir de ahora, `Y` será exactamente lo mismo que `X`. Esto es, `Y` es la _misma_  celda que `X`.
4. Se asigna 10 a `Y`, y por lo tanto a `X` (ya que son la misma celda).
5. `{Access X}` devuelve el valor que contiene la celda `X` (`Y`), es decir, 10. Por lo tanto `{Access X}==10` es `true`.
6. Como se dijo antes, `X` e `Y`, son la misma celda, y por lo tanto `X==Y` es `true`.
7. Se crea la nueva celda `Z` con un valor de 10.
8. Aunque contengan el mismo valor, 10, `Z` e `Y` son celdas diferentes, y `Z==Y` es `false`.
9. El valor de la celda `X` y el de la celda `Z` son iguales, por lo que `@X==@Z` es `true`.
