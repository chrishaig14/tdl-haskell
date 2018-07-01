local L Foldl Sum in
   fun {Foldl L F U}
      case L of
	 H|T then
	 {Foldl T F {F U H}}
      else U
      end
   end
   
   fun {Sum A B}
      A + B
   end
   
   L = [1 2 3 4 5]
   {Browse {Foldl L Sum 0}}
end


      