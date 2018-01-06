local Producer Consumer Filter Disp in
   fun {Producer S}
      fun {Prod M}
	 if M<S+1 then M|{Prod M+1}
	 else nil
	 end
      end
   in
      {Prod 1}
   end

   fun {Filter S}
      case S of X|S2 then
	 if (X mod 2) == 1 then X|{Filter S2}
	 else {Filter S2} end
      else nil end
   end

   fun {Consumer S}
      fun {Con S A}
	 case S of X|S2 then
	    {Con S2 A+X}
	 else A end
      end
   in
      {Con S 0}
   end

   proc {Disp S}
      case S of H|T then {Browse H} {Disp T} end
   end

   local P F in
      thread P={Producer 20} end
      thread F={Filter P} end
      %thread {Disp F} end
      thread {Browse {Consumer F}} end
   end
end
