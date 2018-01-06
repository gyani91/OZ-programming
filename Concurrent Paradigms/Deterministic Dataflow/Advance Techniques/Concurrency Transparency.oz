declare
fun {CMap Xs F}
   case Xs
   of nil then nil
   [] X|Xr then
      thread {F X} end | {CMap Xr F}
   end
end

declare F
{Browse {CMap [1 2 3 4] F}} %Execute this region

F = fun {$ X} X+1 end %Bound this function by executing this line
