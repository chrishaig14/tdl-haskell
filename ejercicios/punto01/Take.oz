local Take L in
   fun {Take XS N}
      if N =< 0 then nil
	 else
	 case XS of
	    H|T then
	    H | {Take T (N-1)}
	 else
	    nil
      end
      end
      
   end
   L = [2 3 1]
   {Browse {Take L 2}}
end