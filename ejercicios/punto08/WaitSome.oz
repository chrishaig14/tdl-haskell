local WaitSome X Y Z in
  
   proc {WaitSome Xs}
      local Ok WaitAll in
	 proc {WaitAll Xs}
	    case Xs of
	       H|T then
	       thread {Wait H} Ok = true end
	       {WaitAll T}
	    else
	       skip
	    end
	 end
	 {WaitAll Xs}
	 {Wait Ok}
      end
   end
   
   thread {Delay 20000} X = 1 end
   thread {Delay 30000} Y = 2 end
   thread {Delay 10000} Z = 3 end
   {WaitSome [X Y Z]}
   {Browse 'Ready'}
   {Browse 'X'#X#'Y'#Y#'Z'#Z}
end