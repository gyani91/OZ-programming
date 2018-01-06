%Concurrent Deployment: Dynamically building a pipeline during execution

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

fun {Sieve Xs M}
   case Xs
   of nil then nil
   [] X|Xr then
      if X=<M then
	 X|{Sieve thread {Filter Xr X} end M}
      else Xs end
   end
end

declare Xs Ys in
thread Xs={Prod 2 100000} end
thread Ys={Sieve Xs 316} end
thread {Browse Ys} end
