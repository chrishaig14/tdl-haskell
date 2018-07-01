local Member L in
   fun {Member XS Y}
      case XS of
	 H|T then
	 if H == Y then
	    true
	 else
	    {Member T Y}
	 end
      else
	 false
      end
   end
   
   % L = nil
   L = [1 2 3 4 5 6 7 8 9 10]
   
   {Browse {Member L 2}}
end


      