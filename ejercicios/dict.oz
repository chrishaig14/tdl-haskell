local Dict NewDict Put Get Domain D1 D2 D3 in
   fun {NewDict}
      empty()
   end
   fun {Put Dict Key Value}
      case Dict of
	 empty() then node(l:empty k:Key v:Value r:empty)
      [] node(k1 l1 r1 v1) then what()
	 else empty
      end
   end
   D1 = {NewDict}
   {Browse D1}
   D2 = {Put D1 'Christian' 24}
   {Browse D2}
   D3 = {Put D2 'Alex' 22}
   {Browse D3}
end
