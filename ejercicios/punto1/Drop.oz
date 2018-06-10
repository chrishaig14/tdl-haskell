local Drop L in
   fun {Drop N XS}
      if N =< 0 then XS
	 else
      case XS of
	 H|T then
	 {Drop (N-1) T}
      else nil
      end
      end
      
   end
   L = [10 9 8 7 6 5 4 3 2 1]
   {Browse 'Length: '#{Drop (1) L}}
end


      