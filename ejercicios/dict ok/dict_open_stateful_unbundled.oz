local Dict NewDict Put Get Domain D1 in
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
   
   
   D1 = {NewDict}
   {Browse @D1}
   {Put D1 'Christian' 24}
   {Browse @D1}
   {Put D1 'Alex' 22}
   {Browse @D1}
   {Browse {Get D1 'Christian'}}
   {Browse {Get D1 'Alex'}}
   {Browse {Get D1 'Juan'}}
end
