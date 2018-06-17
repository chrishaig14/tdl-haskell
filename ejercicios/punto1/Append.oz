local Append L1 L2 in
   fun {Append XS YS}
      case XS#YS of
	 (H|T)#YS then
	 H | {Append T YS}
      [] XS#nil
      then XS
      [] nil#YS
	 then YS
      else nil
      end
   end
   
   L1 = [10 9 8 7 6 5 4 3 2 1]
   L2 = [1 2 3 4 5 6 7 8 9 10]
   %L1 = nil
   %L2 = nil
   
   {Browse 'Length: '#{Append L1 L2}}
end


      