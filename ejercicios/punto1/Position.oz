local Position L in
   fun {Position X XS}
      case XS of
	 H|T then
	 
	 if H == X then
	    0
	 else
	    1 + {Position X T}
	 end
	 
      else
	 0 % si asumimos que x ya esta en xs, nunca va a llegar aca pero hay que poner algo para que compile
      end
   end
   
   L = [10 9 8 7 6 5 4 3 2 1]
   
   {Browse 'Length: '#{Position 234 L}}
end


      