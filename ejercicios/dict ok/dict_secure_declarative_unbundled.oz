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
   end
   
   D1 = {NewDict}
   {Browse D1}
   D2 = {Put D1 'Christian' 24}
   {Browse D2}
   D3 = {Put D2 'Alex' 22}
   {Browse D3}
   {Browse {Get D3 'Christian'}}
   {Browse {Get D3 'Alex'}}
   {Browse {Get D3 'Juan'}}
end