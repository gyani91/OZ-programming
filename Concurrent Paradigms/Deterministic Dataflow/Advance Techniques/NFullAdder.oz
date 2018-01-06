declare
fun {AndG X Y}
   X*Y
end

fun {OrG X Y}
   X+Y-X*Y
end

fun {XorG X Y}
   X+Y-2*X*Y
end

proc {FullAdder X Y Z C S}
   A B D E F
in
   A={AndG X Y}
   B={AndG Y Z}
   D={AndG X Z}
   F={OrG B D}
   C={OrG A F}
   E={XorG X Y}
   S={XorG Z E}
end

fun {ListAdder L1 L2}
   case L1#L2 of nil#nil then nil#0
   [] (E1|R1)#(E2|R2) then
      case {ListAdder R1 R2} of Lst#Cin then
	 %Recursive call in case (reversing effect)
	 local Cout S in
	    {FullAdder E1 E2 Cin Cout S}
	    (S|Lst)#Cout
	 end
      end
   end
end

fun {NFullAdder S1 S2}
   case S1#S2 of
      (L1|R1)#(L2|R2) then {ListAdder L1 L2}|{NFullAdder R1 R2}
   else nil end
end

fun {RandList N}
   if N==0 then nil
   else ({OS.rand} mod 2)|{RandList N-1} end
end

fun {Stream N I L}
   if I-1==L then _
   else {RandList N}|{Stream N I+1 L} end
end

local S1 S2 S3 in
   %S1=[1 1 1 1 1]|[0 0 0 0 0]|[1 1 1 1 0]|_
   %S2=[1 1 1 1 1]|[0 0 0 0 0]|[0 0 0 0 1]|_
   thread S1 = {Stream 4 1 3} end
   thread S2 = {Stream 4 1 3} end
   thread S3 = {NFullAdder S1 S2} end
   thread {Browse S1} end
   thread {Browse S2} end
   thread {Browse S3} end
end