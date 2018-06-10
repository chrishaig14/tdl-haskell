local Take L in
   fun {Take N XS}
      if N =< 0 then nil
	 else
      case XS of
	 H|T then
	 H | {Take (N-1) T}
      else nil
      end
      end
      
   end
   L = [2 3 1]
   {Browse 'Length: '#{Take (0-5) L}}
end


      