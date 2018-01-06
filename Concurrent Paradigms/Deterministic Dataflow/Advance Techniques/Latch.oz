%Sequential Logic - Logic with memory

declare

fun {DelayG S}
   0|S %shifting 1 bit by adding 0 in the beginning
end

fun {NotG X}
   1-X
end

fun {AndG X Y}
   X*Y
end

fun {OrG X Y}
   X+Y-X*Y
end

fun {XorG X Y}
   X+Y-2*X*Y
end

proc {Latch C Di Do}
   A B E F
in
   F={DelayG Do}
   A={AndG C F}
   E={NotG C}
   B={AndG E Di}
   Do={OrG A B}
end

fun {LatchList C Di}
   case C#Di of (E1|R1)#(E2|R2) then
      local Do in
	 {Latch E1 E2 Do}
	 Do|{Latch R1 R2}
      end
   else nil end
end


fun {RandList N}
   if N==0 then nil
   else ({OS.rand} mod 2)|{RandList N-1} end
end

local C Di Do in
   C={RandList 10}
   Di={RandList 10}
   thread Do = {LatchList C Di} end
   thread {Browse Do} end
end
