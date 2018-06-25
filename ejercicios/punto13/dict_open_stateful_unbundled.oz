local NewDict Put Get GetAllPairs AddAll Comp Domain DictCF L CountAndSort in
   fun {NewDict}
      {NewCell empty()}
   end
   proc {Put C Key Value}
      case @C of
	 empty() then C := node(l:{NewDict} k:Key v:Value r:{NewDict})
      [] node(l:L k:K v:V r:R) then
	 if Key < K then
	    {Put L Key Value}
	 else
	    if Key == K then
	       C := node(l:L k:Key v:Value r:R)
	    else
	       {Put R Key Value}
	    end
	 end
      end
   end
   fun {Get C Key}
      case @C of
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

   fun {GetAllPairs C}
% devuelve todos los pares clave-valor del diccionario como
% pair(k:clave v:valor)
      case @C of
	 empty then
	 nil
      [] node(l:L k:K v:V r:R) then
	 {List.append {GetAllPairs L} (pair(k:K v:V)|{GetAllPairs R})}
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
