local Length L R in
   % Original
   % fun {Length Xs}
   %    case Xs of
   % 	 nil then 0
   %    [] H|T then 1 + {Length T}
   %    end
   % end

   % Original - Kernel
   % Length = proc{$ Xs R}
   % 	       case Xs of
   % 		  nil then
   % 		  R = 0
   % 	       [] X|Xr then
   % 		  local U in
   % 		     {Length Xr U}
   % 		     R = 1 + U
   % 		  end
   % 	       end
   % 	    end
   
   % Tail recursive
   fun {Length Xs}
      local LengthAux in
   	 fun {LengthAux Xs Accum}
   	    case Xs of
   	       nil
   	    then Accum
   	    [] X|Xr then
   	       local Aux in
   		  Aux = Accum + 1
   		  {LengthAux Xr Aux}
   	       end
   	    end
   	 end
   	 {LengthAux Xs 0}
      end
   end
   
   % Tail recursive - Kernel 
   % Length = proc {$ Xs R}
   % 	       local LengthAux in
   % 		  LengthAux = proc {$ Xs Accum R}
   % 				 case Xs of
   % 				    nil
   % 				 then R = Accum
   % 				 [] X|Xr then
   % 				    local Aux in
   % 				       Aux = Accum + 1
   % 				       {LengthAux Xr Aux R}
   % 				    end
   % 				 end
   % 			      end
   % 		  {LengthAux Xs 0 R}
   % 	       end
   % 	    end
   
   L = [10 9 8 7 6 5 4 3 2 1]

   {Browse {Length L}}

end
