declare
proc {Math M}
   case M
   of add(N M A) then A=N+M
   [] mul(N M A) then A=N*M
   end
end

fun {NewAgent0 Process}
   Port Stream
in
   Port={NewPort Stream}
   thread
      for M in Stream do {Process M} end
   end
   {Browse Stream}
   Port
end

declare Ans R in
R = {NewAgent0 Math}
{Send R add(21 21 Ans)}
end
