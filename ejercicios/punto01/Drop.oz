local Drop L in
   fun {Drop XS N}
      if N =< 0 then XS
	 else
      case XS of
	 H|T then
	 {Drop T (N-1)}
      else nil
      end
      end
      
   end
   L = [10 9 8 7 6 5 4 3 2 1]
   %L = nil
   {Browse {Drop L 5}}
end


      