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
{Test '|'(a [b c]}
end
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg1NDI2ODcyM119
-->