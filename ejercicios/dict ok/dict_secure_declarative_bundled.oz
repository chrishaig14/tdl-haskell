local NewDict D1 D2 D3 D4 D5 D6 A1 A2 A3 in
   fun {NewDict}
      local DictOps in
	 fun {DictOps Dict}
	    local Put Get in
	       fun {Put Key Value}
		  case Dict of
		     empty then
		     {DictOps node(l:{DictOps empty} k:Key v:Value r:{DictOps empty})}
		  [] node(l:L k:K v:V r:R) then
		     if Key < K then
			{DictOps node(l:{L.put Key Value} k:K v:V r:R)}
		     else
			if Key == K then
			   {DictOps node(l:L k:Key v:Value r:R)}
			else
			   {DictOps node(l:L k:K v:V r:{R.put Key Value})}
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
	       dict(put:Put get:Get)
	    end
	 end
	 {DictOps empty}
      end
      
   end
   D1 = {NewDict}
   D2 = {D1.put 'Christian' 24}
   D3 = {D2.put 'Alex' 22}
   {Browse {D3.get 'Christian'}}
   {Browse {D3.get 'Alex'}}
   {Browse {D3.get 'Juan'}}
end