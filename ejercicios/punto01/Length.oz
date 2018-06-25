local Length L in
   fun {Length XS}
      case XS of
	 _|T then
	     1 + {Length T}
      else 0
      end
   end
   L = [10 9 8 7 6 5 4 3 2 1]
   %L = nil
   {Browse 'Length: '#{Length L}}
end


      