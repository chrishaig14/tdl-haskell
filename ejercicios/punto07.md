# 7 Currying

Currying es el proceso de transformar una función que podría tomar muchos argumentos en otra que toma un solo argumento y devuelve una función siempre que aún le falten argumentos.
En Haskell, por ejemplo, todas las funciones que en principio necesitan mas de un parametro utilizan currying, ya que las funciones solo pueden recibir un único parámetro. 
Entonces, al aplicar currying, si tenemos una función que recibe dos parámetros y devuelve otro, en realidad lo que tenemos es una función que recibe un parámetro, y devuelve otra función que recibe un parámetro y, finalmente, devuelve el resultado.
Gracias a esto, podemos utilizar funciones con menos parámetros de los que recibe, y generar funciones evaluadas parcialmente.

Ilustramos este concepto con un ejemplo sencillo en Haskell, en el cual generamos una función `multThree` que necesita tres parámetros numéricos y devuelve la multiplicacion de los tres.

```haskell
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
```
```haskell
> multThree 3 5 9
135
```

Gracias al Currying podemos llamar a la funcion `multThree` y generar otra funcion `multTwoWithNine` que tome dos parametros y devuelve la multiplicacion de ellos por  9:
```haskell
multTwoWithNine = multThree 9
```
```haskell
> multTwoWithNine 2 3 
54
```
