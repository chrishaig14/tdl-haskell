local Dict NewDict Put Get Domain D1 in
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
   in
      ops(put:Put get:Get)
   end
   
   
   D1 = {NewDict}
   {Browse D1}
   {D1.put 'Christian' 24}
   {Browse D1}
   {D1.put 'Alex' 22}
   {Browse {D1.get 'Christian'}}
   {Browse {D1.get 'Alex'}}
   {Browse {D1.get 'Juan'}}
end
