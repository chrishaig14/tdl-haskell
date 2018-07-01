local L GreaterThan4 Filter Res in
   fun {Filter XS F}
      case XS of
	 H|T then
	 local Rest in
	    Rest = {Filter T F}
	    if {F H} then H | Rest else Rest end
	 end
      else nil
      end
   end
   
   L = [2 3 1 5 8 4 10 9 6 7 4 7 8 7 7 6]
   fun {GreaterThan4 X}
      X > 4
   end
   Res = {Filter L GreaterThan4}
   
   {Browse Res}
end


      