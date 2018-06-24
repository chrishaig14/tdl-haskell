local NewDict Put Get GetAllPairs Comp Domain AddAll DictCF1 DictCF2 L in
   fun {NewDict}
      empty()
   end
   fun {Put Dict Key Value}
      case Dict of
	 empty() then node(l:empty k:Key v:Value r:empty)
      [] node(l:L k:K v:V r:R) then
	 if Key < K then
	    node(l:{Put L Key Value} k:K v:V r:R)
	 else
	    if Key == K then
	       node(l:L k:Key v:Value r:R)
	    else
	       node(l:L k:K v:V r:{Put R Key Value})
	    end
	 end
      end
   end
   fun {Get Dict Key}
      case Dict of
	 empty() then nothing
      [] node(l:L k:K v:V r:R) then
	 if Key < K then
	    {Get L Key}
	 else
	    if Key == K
	    then V
	    else
	       {Get R Key}
	    end
	    
	 end
      end
   end
   fun {Comp A B}
      % devuelve true si A va antes que B, A/B = pair(k:letra v:frec). false si no
      if A.v < B.v then true else
	 if A.v > B.v then false else
	    if A.k < B.k then true else
	       false
	    end
	 end
      end
   end
   fun {GetAllPairs Dict}
      % devuelve todos los pares clave-valor del diccionario como
      % pair(k:clave v:valor)
      case Dict of
	 empty then
	 nil
      [] node(l:L k:K v:V r:R) then
	 {List.append {GetAllPairs L} (pair(k:K v:V)|{GetAllPairs R})}
      end
   end
   
   fun {Domain Dict}
      local Pairs in
	 Pairs = {GetAllPairs Dict}
	 {List.sort Pairs Comp}
      end
   end

   fun {AddAll L DictChar}
      % agrega todas la letras al diccionario de char -> frec
      % va actualizando las frecuencias
      case L of
	 H|T then
	 local D C Aux F in
	    % convierto a char
	    C = {Char.toAtom H}
	    Aux = {Get DictChar C}
	    % actualizo la frecuencia
	    F = if Aux == nothing then 0 else Aux end
	    D = {Put DictChar C (F+1)}
	    {AddAll T D}
	 end
      else
	 DictChar
      end
   end
   
   L = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
   DictCF1 = {NewDict}
   DictCF2 = {AddAll L DictCF1}
   {Browse {Domain DictCF2}}
end
