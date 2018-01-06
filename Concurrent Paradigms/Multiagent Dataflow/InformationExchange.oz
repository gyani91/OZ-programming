declare
fun {Eval Port}
   proc {Process Stream}
      case Stream of Function#Input|Tail then
	 {Send Port {Function Input}}
	 {Process Tail}
      end
   end
in
   local P S in
      P = {NewPort S}
      thread {Process S} end
      P
   end
end

fun {Triple X} X*3 end
fun {PlusTwo X} X+2 end

local A B C in
   A = {NewPort B}
   C={Eval A}
   {Browse B}
   {Send C Triple#2}
   {Delay 1000}
   {Send C PlusTwo#9}
   {Delay 1000}
   {Send C Triple#4}
end

   