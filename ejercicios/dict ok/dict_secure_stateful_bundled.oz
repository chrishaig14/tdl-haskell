local NewDict Comp Domain AddAll DictCF L CountAndSort in
   fun {NewDict}
      C = {NewCell empty()}
      proc {Put Key Value}
	 case @C of
	    empty() then C := node(l:{NewDict} k:Key v:Value r:{NewDict})
	 [] node(l:L k:K v:V r:R) then
	    if Key < K then
	       {L.put Key Value}
	    else
	       if Key == K then
		  C := node(l:L k:Key v:Value r:R)
	       else
		  {R.put Key Value}
	       end
	    end
	 end
      end
      fun {Get Key}
	 case @C of
	    empty() then nothing
	 [] node(l:L k:K v:V r:R) then
	    if Key < K then
	       {L.get Key}
	    else
	       if Key == K
	       then V
	       else
		  {R.get Key}
	       end
	    end
	 end
      end
      fun {GetAllPairs}
% devuelve todos los pares clave-valor del diccionario como
% pair(k:clave v:valor)
	 case @C of
	    empty then
	    nil
	 [] node(l:L k:K v:V r:R) then
	    {List.append {L.getAllPairs} (pair(k:K v:V)|{R.getAllPairs})}
	 end
      end
   in
      ops(put:Put get:Get getAllPairs:GetAllPairs)
   end
   
   fun {Comp A B}
      if A.v < B.v then true else
	 if A.v > B.v then false else
	    if A.k < B.k then true else
	       false
	    end
	 end
      end
   end
   
   fun {Domain Dict}
      local Pairs in
	 Pairs = {Dict.getAllPairs}
	 {List.sort Pairs Comp}
      end
   end

   proc {AddAll L DictChar}
      % agrega todas la letras al diccionario de char -> frec
      % va actualizando las frecuencias
      case L of
	 H|T then
	 local C Aux F in
	    % convierto a char
	    C = {Char.toAtom H}
	    Aux = {DictChar.get C}
	    % actualizo la frecuencia
	    F = if Aux == nothing then 0 else Aux end
	    {DictChar.put C (F+1)}
	    {AddAll T DictChar}
	 end
      else
	 skip
      end
   end


   

   proc  {CountAndSort L}
   
      DictCF = {NewDict}
      {AddAll L DictCF}
      {Browse {Domain DictCF}}
   end

   L = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
   {CountAndSort L}
end
