local Member L in
   fun {Member X XS}
      case XS of
	 H|T then
	 
	 if H == X then
	    true
	 else
	    {Member X T}
	 end
	 
      else
	 false
      end
   end
   
   L = nil
   
   {Browse 'Length: '#{Member 177 L}}
end


      