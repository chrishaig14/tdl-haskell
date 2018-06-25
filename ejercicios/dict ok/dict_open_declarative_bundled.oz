local NewDict DictObject L DictCF1 DictCF2 AddAll Domain Comp CountAndSort in
   fun {DictObject Dict}
      local Put Get GetAllPairs in
	 fun {Put Key Value}
	    case Dict of
	       empty then
	       {DictObject node(l:{DictObject empty} k:Key v:Value r:{DictObject empty})}
	    [] node(l:L k:K v:V r:R) then
	       if Key < K then	  
		  {DictObject node(l:{L.put Key Value} k:K v:V r:R)}
	       else
		  if Key == K then
		     {DictObject node(l:L k:Key v:Value r:R)}
		  else
		     {DictObject node(l:L k:K v:V r:{R.put Key Value})}
		  end
	       end
	    end
	 end
	 fun {Get Key}
	    case Dict of
	       empty then
	       nothing
	    [] node(l:L k:K v:V r:R) then
	       if Key < K then
		  {L.get Key}
	       else
		  if Key == K then
		     V
		  else
		     {R.get Key}
		  end
	       end
	    end
	 end
	 fun {GetAllPairs}
% devuelve todos los pares clave-valor del diccionario como
% pair(k:clave v:valor)
	    case Dict of
	       empty then
	       nil
	    [] node(l:L k:K v:V r:R) then
	       {List.append {L.getAllPairs} (pair(k:K v:V)|{R.getAllPairs})}
	    end
	 end
	 dict(put:Put get:Get getAllPairs:GetAllPairs)
      end
   end
   fun {NewDict}
      {DictObject empty}
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

   fun {AddAll L DictChar}
      % agrega todas la letras al diccionario de char -> frec
      % va actualizando las frecuencias
      case L of
	 H|T then
	 local D C Aux F in
	    % convierto a char
	    C = {Char.toAtom H}
	    Aux = {DictChar.get C}
	    % actualizo la frecuencia
	    F = if Aux == nothing then 0 else Aux end
	    D = {DictChar.put C (F+1)}
	    {AddAll T D}
	 end
      else
	 DictChar
      end
   end


   proc {CountAndSort L}
      DictCF1 = {NewDict}
      DictCF2 = {AddAll L DictCF1}
      {Browse {Domain DictCF2}}
   end
   
   L = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
   {CountAndSort L}
end