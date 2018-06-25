local WaitSome X Y Z in
   proc {WaitSome Xs R}
      case Xs of
	 H|nil then {WaitOr H H}
      [] H|T then
	 local G in
	    thread {WaitSome T _}
	       G = 1
	    end
	    {WaitOr H G}
	    end
      end
   end
   thread {Delay 20000} X = 1 end
   thread {Delay 30000} Y = 2 end
   thread {Delay 10000} Z = 3 end
   {WaitSome [X Y Z] _}
   {Browse X#Y#Z}
end