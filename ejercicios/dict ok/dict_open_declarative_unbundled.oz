local Dict NewDict Put Get Domain D1 D2 D3 D4 D5 D6 A1 A2 A3 in
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
   
   
   D1 = {NewDict}
   {Browse D1}
   D2 = {Put D1 'Christian' 24}
   {Browse D2}
   D3 = {Put D2 'Alex' 22}
   {Browse D3}
   D4 = {Put D3 'Christian' 25}
   D5 = {Put D4 'Evelyn' 17}
   {Browse D5}
   {Browse {Get D5 'Christian'}}
   {Browse {Get D5 'Evelyn'}}
   {Browse {Get D5 'Juan'}}
end
