declare
fun {Prod N}
   {Delay 1000}
   N|{Prod N+1}
end

proc {Disp S}
   case S of X|S2 then {Browse X}{Disp S2} end
end

declare S
thread S={Prod 1} end
thread {Disp S} end
