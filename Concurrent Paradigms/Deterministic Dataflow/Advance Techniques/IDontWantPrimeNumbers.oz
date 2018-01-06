declare
fun {Prod B E}
   if B<E+1 then {Delay 100} B|{Prod B+1 E}
   else nil end
end

fun {Filter Xs K}
   case Xs of X|Xr then
      if X mod K \= 0 then X|{Filter Xr K}
      else {Filter Xr K} end
   else nil
   end
end

fun {Sieve Xs}
   case Xs
   of nil then nil
   [] X|Xr then X|{Sieve thread {Filter Xr X} end}
   end
end

fun {NotPrime S1 S2}
   case S1 of X|Xr then
      case S2 of Y|Yr then
	 if Y==X then {NotPrime Xr Yr}
	 %elseif Y>X then X|{NotPrime Xr S2}
	 else X|{NotPrime Xr S2}
	 end
      else S1 end
   end
end

declare S1 S2 S3 in
thread S1={Prod 2 20} end
thread S2={Sieve S1} end
thread S3={NotPrime S1 S2} end
thread {Browse S3} end
