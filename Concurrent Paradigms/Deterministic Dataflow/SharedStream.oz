declare
proc {Add S}
   thread
      case S of r('add' X Y R)|T then
         R=X+Y
         {Add T}
      [] H|T then {Add T}
      else skip end
   end
end

proc {Sub S}
   thread
      case S of r('sub' X Y R)|T then
         R=X-Y
         {Sub T}
      [] H|T then {Sub T}
      else skip end
   end
end

proc {Mul S}
   thread
      case S of r('mul' X Y R)|T then
         R=X*Y
         {Mul T}
      [] H|T then {Mul T}
      else skip end
   end
end

proc {Divide S}
   thread
      case S of r('divide' X Y R)|T then
         R=X div Y
         {Divide T}
      [] H|T then {Divide T}
      else skip end
   end
end

local S in
   {Add S}
   {Sub S}
   {Mul S}
   {Divide S}
   S = r('add' 1 2 _)|r('sub' 10 5 _)|r('sub' 5 5 _)|_
   {Browse S} % Displays: r('add' 1 2 3)|r('sub' 10 5 5)|r('sub' 5 5 0)|_
end