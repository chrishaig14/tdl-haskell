local L S Filter RES in
   fun {Filter XS F}
      case XS of
	 H|T then
	 local REST in
	    REST = {Filter T F}
	    if {F H} then H | REST else REST end
	 end
      else nil
      end
   end
   
      L = [2 3 1 5 8 4 10 9 6 7 4 7 8 7 7 6]
   fun {S X}
      X > 4
   end
      RES = {Filter L S}
   {Browse 'Length: '#RES}
end


      