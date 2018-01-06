%Combinational Logic - Logic without memory

declare
fun {GateMaker F}
   fun {$ Xs Ys}
      fun {GateLoop Xs Ys}
	 case Xs#Ys of (X|Xr)#(Y|Yr) then
	    {F X Y}|{GateLoop Xr Yr}
	 end
      end
   in
      thread {GateLoop Xs Ys} end
   end
end

fun {RandList N}
   if N==0 then nil
   else ({OS.rand} mod 2)|{RandList N-1} end
end

declare AndG OrG NandG NorG XorG S1 S2 in
AndG={GateMaker fun {$ X Y} X*Y end}
OrG={GateMaker fun {$ X Y} X+Y-X*Y end}
NandG={GateMaker fun {$ X Y} 1-X*Y end}
NorG={GateMaker fun {$ X Y} 1-X-Y+X*Y end}
XorG={GateMaker fun {$ X Y} X+Y-2*X*Y end}

S1={RandList 3}
S2={RandList 3}

thread {Browse S1} end
thread {Browse S2} end
thread {Browse {OrG S1 S2}} end