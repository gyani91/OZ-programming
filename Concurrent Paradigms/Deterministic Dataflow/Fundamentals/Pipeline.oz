declare
fun {Prod N}
   {Delay 1000}
   N|{Prod N+1}
end

proc {Disp S}
   case S of X|S2 then {Browse X}{Disp S2} end
end

fun {Trans S}
   case S of X|S2 then X*X|{Trans S2} end
end %Pipeline

declare S1 S2
thread S1={Prod 1} end
thread S2={Trans S1} end
thread {Disp S2} end