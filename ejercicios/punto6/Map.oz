local Map L F in
   fun {Map XS F}
      case XS of
	 H|T then
	 {F H} | {Map T F}
      else nil
      end
   end
   
      L = [2 3 1]
      fun {F X}
	 X*X + 2
      end
      
   {Browse 'Length: '#{Map L F}}
end


      