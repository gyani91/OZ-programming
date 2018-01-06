declare

fun {NewAgentC Class Init}
   P
   Agent = proc {$ M} {Send P M} end
   This = class $ attr this: Agent end
   MyClass = class $ from Class This end
   Obj = {New MyClass Init}
in
   thread S in
      P = {NewPort S}
      for M in S do {Obj M} end
   end
   Agent
end

fun {NewAgentF Process InitState}
   Port Stream
in
   Port={NewPort Stream}
   thread Dummy in
      Dummy={FoldL Stream Process InitState}
   end
   proc {$ M} {Send Port M} end
end

fun {NewAgent V I}
   if {Value.type V} == procedure then
      {NewAgentF V I}
   elseif {Value.type V} == 'class' then
      {NewAgentC V I}
   else
      V
   end
end
