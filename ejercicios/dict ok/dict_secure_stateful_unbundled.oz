local Dict D1 D2 D3 NewDict Put Get NewWrapper in
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
   end
   
   D1 = {NewDict}
   {Browse D1}
   {Put D1 'Christian' 24}
   {Put D1 'Alex' 22}
   {Browse {Get D1 'Christian'}}
   {Browse {Get D1 'Alex'}}
   {Browse {Get D1 'Juan'}}
end