declare
fun {Counter InS}
   fun {Add X A}
      case A of C#N|A2 then
	 if C==X then C#(N+1)|A2
	 else C#N|{Add X A2}
	 end
      else X#1|nil
      end
   end
   fun {CountAux InS A}
      case InS of X|S2 then
	 local Y = {Add X A} in
	    Y|{CountAux S2 Y}
	 end
      [] nil then nil
      else _ end
   end
in
   thread {CountAux InS nil} end
end

local InS X in
   X={Counter InS}
   InS=a|b|a|c|_
   %{Delay 2000}
   {Browse X}
end
   
      