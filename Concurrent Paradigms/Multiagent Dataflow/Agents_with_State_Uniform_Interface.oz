declare
fun {CellProcess S M}
   case M
   of assign(New) then
      New
   [] access(Old) then
      Old=S S
   end
end

fun {FoldL Xs F S}
   case Xs
   of nil then S
   [] X|Xr then {FoldL Xr F {F S X}}
   end
end

fun {NewAgent Process InitState}
   Port Stream
in
   Port={NewPort Stream}
   thread Dummy in
      Dummy={FoldL Stream Process InitState}
   end
   proc {$ M} {Send Port M} end
   %Sending a higher-order proc instead of a port makes the interface uniform for objects and agents
end

declare Cell
Cell = {NewAgent CellProcess 0}
{Cell assign(1)} %Sets state as 1
{Browse {Cell access($)}} %Use nesting marker $ to fetch the current state