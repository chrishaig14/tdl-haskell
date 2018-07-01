local DictCF L AddAll Comp GetAllPairs  NewDict Put Get Domain NewWrapper CountAndSort in
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
	 {NewCell {Wrap empty()}}
      end
      proc {Put C Key Value}
	 local D in
	    D = {Unwrap @C}
	    case D of
	       empty() then C:= {Wrap node(l:{NewDict} k:Key v:Value r:{NewDict})}
	    [] node(l:L k:K v:V r:R) then
	       if Key < K then
		  {Put L Key Value}
		  C := {Wrap node(l:L k:K v:V r:R)}
	       else
		  if Key == K then
		     C := {Wrap node(l:L k:Key v:Value r:R)}
		  else
		     {Put R Key Value}
		     C := {Wrap node(l:L k:K v:V r:R)}
		  end
	       end
	    end
	 end
      end
      fun {Get C Key}
	 local D in
	    D = {Unwrap @C}
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
      fun {GetAllPairs C}
% devuelve todos los pares clave-valor del diccionario como
% pair(k:clave v:valor)
	 local D in
	    D = {Unwrap @C}
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
      % k: letra, v:frecuencia
      % la frec(A) < frec(B), A va antes que B
      if A.v < B.v then true else
	 % la frec(A) > frec(B), A va después que B
	 if A.v > B.v then false else
	    % frec(A) = frec(B), si letra(A) < letra(B), A va antes que B
	    if A.k < B.k then true else
	       % si letra(A) > letra(B), A va después que B
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

   proc {AddAll L DictChar}
      % agrega todas la letras al diccionario de char -> frec
      % va actualizando las frecuencias
      case L of
	 H|T then
	 local C Aux F in
	    % convierto a char
	    C = {Char.toAtom H}
	    Aux = {Get DictChar C}
	    % actualizo la frecuencia
	    F = if Aux == nothing then 0 else Aux end
	    {Put DictChar C (F+1)}
	    {AddAll T DictChar}
	 end
      else
	 skip
      end
   end

   proc {CountAndSort L}
      DictCF = {NewDict}
      {AddAll L DictCF}
      {Browse {Domain DictCF}}
   end
   

   L = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
   {CountAndSort L}
   
end