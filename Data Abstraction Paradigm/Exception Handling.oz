declare
fun {Eval E}
   if {IsNumber E} then E
   else case E
	of plus(X Y) then {Eval X}+{Eval Y}
	[] times(X Y) then {Eval X}*{Eval Y}
	else raise badExpression(E) end
	end
   end
end

try
   {Browse {Eval plus(23 times(5 5))}}
   {Browse {Eval plus(23 minus(5 5))}}
catch X then {Browse X} finally {Browse 'will always run'} end