local Map L F in
   fun {Map XS F}
      case XS of
	 H|T then
	 {F H} | {Map T F}
      else nil
      end
   end
   
   L = [5 4 3 2 1]
   fun {F X}
      X*X + 2
   end
      
   {Browse {Map L F}}
end


      