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
   Port
end

declare Cell
Cell = {NewAgent CellProcess 0}
{Send Cell assign(1)} %Sets state as 1
{Browse {Send Cell access($)}} %Use nesting marker $ to fetch the current state