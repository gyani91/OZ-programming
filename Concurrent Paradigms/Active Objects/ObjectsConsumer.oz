declare
class List
   attr list
   meth init(L) list:=L end
   meth isEven(I $) ({Nth @list I+1} mod 2)==0 end
   meth get(I $) {Nth @list I+1} end
   meth getList($) @list end
end

fun {Producer M N}
   fun {Mrand X}
      if X == 0 then nil
      else ({OS.rand} mod 10)|{Mrand X-1} end
   end
in
   if N == 0 then nil
   else {New List init({Mrand M})}|{Producer M N-1} end
end

fun {Filter S J}
   case S of X|Xr then
      if {X isEven(J $)} then X|{Filter Xr J}
      else {Filter Xr J} end
   else nil end
end

fun {Consumer P S1 S2}
   case S1#S2 of (X|Xr)#(Y|Yr) then
      if {X get(P $)} =< {Y get(P $)} then X|Y|{Consumer P Xr Yr}
      else Y|X|{Consumer P Xr Yr} end
   else nil end
end

local S1 S2 S in
   thread S1={Producer 4 5} end
   thread S2={Filter S1 2} end
   thread S={Consumer 1 S1 S2} end
   thread for M in S1 do {Browse {M getList($)}} end end
   thread for M in S2 do {Browse {M getList($)}} end end
   thread for M in S do {Browse {M getList($)}} end end
end
  
