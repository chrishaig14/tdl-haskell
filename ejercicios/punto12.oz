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