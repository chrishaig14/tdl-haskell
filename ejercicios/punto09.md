# 9.2 Evaluación perezosa - Reverse

La diferencia está en que la función `Rev` de `Reverse2` es _lazy_. Como la función es monolítica (es decir, en este caso particular para invertir la lista, aunque se necesite sólo el primer elemento, se deberán calcular todas las posiciones de la lista) no es necesario que `Rev` sea lazy. El resultado obtenido por las dos funciones es el mismo, pero como las funciones lazy generan threads (en el fondo, _lazy_ se transforma en _ByNeed_ y esto lanza un thread cuando se requiere el valor), la funcion `Reverse2` es menos eficiente.
