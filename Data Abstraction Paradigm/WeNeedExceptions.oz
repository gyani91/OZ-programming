declare
fun {DivIfNot5 N T}
   if (T mod 5)==0 then error5
   else N div T end
end

fun {DivIfNot4 N T}
   X in
   X={DivIfNot5 N T-1}
   if (T mod 4)==0 then error4
   else
      if {IsNumber X} then X div T
      else X end
   end
end

fun {DivIfNot3 N T}
   X in
   X={DivIfNot4 N T-1}
   if (T mod 3)==0 then error3
   else
      if {IsNumber X} then X div T
      else X end
   end
end

fun {DivIfNot5E N T}
   if (T mod 5)==0 then raise error5 end
   else N div T end
end

fun {DivIfNot4E N T}
   X in
   X={DivIfNot5E N T-1}
   if (T mod 4)==0 then raise error4 end
   else X div T end
end

fun {DivIfNot3E N T}
   X in
   X={DivIfNot4E N T-1}
   if (T mod 3)==0 then raise error3 end
   else X div T end
end

try
   {Browse {DivIfNot4E 60 3}}
   {Browse {DivIfNot3E 60 20}}
   {Browse {DivIfNot5E 60 3}}
   {Browse {DivIfNot3E 60 7}}
catch X then {Browse X} end

   {Browse {DivIfNot4 60 3}}
   {Browse {DivIfNot3 60 20}}
   {Browse {DivIfNot5 60 3}}
   {Browse {DivIfNot3 60 7}}                           
