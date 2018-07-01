# 4. Case
```oz
local Test in
   proc {Test X}
      case X
      of a|Z then {Browse 'case'(1)}
      [] f(a) then {Browse 'case'(2)}
      [] Y|Z andthen Y==Z then {Browse 'case'(3)}
      [] Y|Z then {Browse 'case'(4)}
      [] f(Y) then {Browse 'case'(5)}
      else {Browse 'case'(6)} end
   end
   
   {Test [b c a]}
   {Test f(b(3))}
   {Test f(a)}
   {Test f(a(3))}
   {Test f(d)}
   {Test [a b c]}
   {Test [c a b]}
   {Test a|a}
   {Test '|'(v b)}
   {Test '|'(a a)}
   {Test '|'(b b)}
   {Test '|'(a b c)}
   {Test '|'(a [b c])}
   
end
```
Para analizar qué sucede cuando se ejecuta este código, hay que tener en cuenta que:

* `X|Y` es simplemente *syntactic sugar*  para `'|'(1:X 2:Y)`
* `[X Y]` también es *syntactic sugar* para `X|Y|nil`, o sea `'|'(1:X 2:'|'(1:Y 2:nil))`, y  `[X Y Z]` sería `X|[Y Z]` 
* `x(a b ...)` es equivalente a `x(1:a 2:b 3:...)`
* los "tokens" que empiezan con minúscula indican *records*, por lo tanto `a` es simplemente un record que no tiene ningún campo

Teniendo en cuenta esto, podemos ver con que matcheará el `case` para cada elemento con que se llama `Test`:

* `[b c a]`: es equivalente a `b|[c a]` o bien `'|'(1:b 2:[c a])`
	* `a|Z`: no matchea, `a` ≠`b`
	* `f(a)`: no matchea, `f`≠`'|'`
	* `Y|Z andthen Y==Z ...`, no matchea `b` ≠`[c a]`
	* `Y|Z`, matchea `Y`=`b` y `Z`=`[c a]`  ✓  -> **case 4**
* `f(b(3))`
	* `a|Z`: no matchea, `a|Z` es equivalente a `'|'(a Z)` y `|` ≠`f`
	* `f(a)`: no matchea, `'a'`≠`b(3)`
	* `Y|Z andthen Y==Z ...`, no matchea `'|'`≠`f`
	* `Y|Z`, no matchea `'|'`≠`f`
	* `f(Y)`: matchea, `Y`=`b(3)` ✓  -> **case 5**
* `f(a)`
	* `a|Z`: no matchea, `a|Z` es equivalente a `'|'(a Z)` y `|` ≠`f`
	* `f(a)`: matchea ✓  -> **case 2**
* `f(a(3))`
	* `a|Z`: no matchea, `a|Z` es equivalente a `'|'(a Z)` y `|` ≠`f`
	* `f(a)`: no matchea, `'a'`≠`a(3)`
	* `Y|Z andthen Y==Z ...`, no matchea `'|'`≠`f`
	* `Y|Z`, no matchea `'|'`≠`f`
	* `f(Y)`: matchea, `Y`=`a(3)` ✓  -> **case 5**
* `f(d)`
	* `a|Z`: no matchea, `a|Z` es equivalente a `'|'(a Z)` y `|` ≠`f`
	* `f(a)`: no matchea, `'a'`≠`d`
	* `Y|Z andthen Y==Z ...`, no matchea `'|'`≠`f`
	* `Y|Z`, no matchea `'|'`≠`f`
	* `f(Y)`: matchea, `Y`=`d` ✓  -> **case 5**
* `[a b c]`: es equivalente a `a|[b c]` o bien `'|'(1:a 2:[b c])`
	* `a|Z`: matchea, `Z=[b c]` ✓  -> **case 1**
* `[c a b]`: es equivalente a `c|[a b]` o bien  `'|'(1:c 2:[a b])`
	* `a|Z`: no matchea, `a` ≠`c`
	* `f(a)`: no matchea, `'f'`≠`'|'`
	* `Y|Z andthen Y==Z ...`, no matchea `c`≠`[a b]`
	* `Y|Z`, matchea `Y`=`c` y `Z`=`[a b]` ✓  -> **case 4**
* `a|a`
	* `a|Z`: matchea, `Z`=`a` ✓  -> **case 1**
* `'|'(v b)`: es equivalente a `v|b`
	* `a|Z`: no matchea, `a` ≠`v`
	* `f(a)`: no matchea, `'f'`≠`'|'`
	* `Y|Z andthen Y==Z ...`, no matchea `v`≠`b`
	* `Y|Z`, matchea `Y`=`v` y `Z`=`b`  ✓  -> **case 4**
* `'|'(a a)`: es equivalente a `a|a`
	* `a|Z`: matchea, `Z`=`a` ✓  -> **case 1**
* `'|'(b b)`: es equivalente a `b|b`
	* `a|Z`: no matchea, `a` ≠`b`
	* `f(a)`: no matchea, `f`≠`'|'`
	* `Y|Z andthen Y==Z ...`, matchea, `Y`=`b` y `Z`=`b` ✓  -> **case 3**
*  `'|'(a b c)`
	* `a|Z`: no matchea, `a|Z` es equivalente a `'|'(a Z)`
	* `f(a)`: no matchea, `'f'`≠`'|'`
	* `Y|Z andthen Y==Z ...`, no matchea, `Y|Z` es equivalente a `'|'(Y Z)`
	* `Y|Z`,  no matchea, `Y|Z` es equivalente a `'|'(Y Z)`
	* `f(Y)`: no matchea, `f`≠`'|'`
	* Por lo tanto -> **case 6**
* `'|'(a [b c])`: es equivalente a `a|[b c]`
	* `a|Z`: matchea, `Z`= `[b c] `  ✓  -> **case 1**
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMxNzgyMzgxMF19
-->