local L Foldr Sum in
   fun {Foldr L F U}
      case L of
	 H|T then
	 {F H {Foldr T F U}}
      else U
      end
   end
   
   fun {Sum A B}
      A + B
   end
   
   L = [1 2 3 4 5]
   {Browse {Foldr L Sum 0}}
end


      