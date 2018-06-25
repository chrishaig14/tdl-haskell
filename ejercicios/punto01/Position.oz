local Position L in
   fun {Position XS Y}
      case XS of
	 H|T then
	 if H == Y then
	    1
	 else
	    1 + {Position T Y}
	 end
      else
	 0 % nunca va a llegar aca si asumimos que ya está, es para que compile. si Y no está, devuelve cualquier cosa
      end
   end
   
   L = [10 9 8 7 6 5 4 3 2 1]
   
   {Browse 'Result: '#{Position L 2}}
end


      