local NewDict Put Get GetAllPairs Comp AddAll Domain NewWrapper L DictCF1 DictCF2  CountAndSort in
   local Wrap Unwrap in
      proc {NewWrapper ?Wrap ?Unwrap}
	 Key={NewName}
      in
	 fun {Wrap X}
	    fun {$ K} if K==Key then X end end
	 end
	 fun {Unwrap W}
	    {W Key}
	 end
      end
      {NewWrapper Wrap Unwrap}
      fun {NewDict}
	 {Wrap empty()}
      end
      fun {Put Dict Key Value}
	 local D in
	    D = {Unwrap Dict}
	    case D of
	       empty() then {Wrap node(l:{NewDict} k:Key v:Value r:{NewDict})}
	    [] node(l:L k:K v:V r:R) then
	       if Key < K then
		  {Wrap node(l:{Put L Key Value} k:K v:V r:R)}
	       else
		  if Key == K then
		     {Wrap node(l:L k:Key v:Value r:R)}
		  else
		     {Wrap node(l:L k:K v:V r:{Put R Key Value})}
		  end
	       end
	    end
	 end
      end
      fun {Get Dict Key}
	 local D in
	    D = {Unwrap Dict}
	    case D of
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
      end
      fun {GetAllPairs Dict}
% devuelve todos los pares clave-valor del diccionario como
% pair(k:clave v:valor)
	 local D in
	    D = {Unwrap Dict}
	    case D of
	       empty then
	       nil
	    [] node(l:L k:K v:V r:R) then
	       {List.append {GetAllPairs L} (pair(k:K v:V)|{GetAllPairs R})}
	    end
	 end
      end
      
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
   proc {CountAndSort L}
      DictCF1 = {NewDict}
      DictCF2 = {AddAll L DictCF1}
      {Browse {Domain DictCF2}}
   end
   
   L = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
   {CountAndSort L}

end