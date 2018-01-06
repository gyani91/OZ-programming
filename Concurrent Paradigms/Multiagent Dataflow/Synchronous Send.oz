declare
proc {Wait X}
   if X==1 then skip else skip end
end

proc {SyncSend P M}
   Ack in
   {Send P M#Ack}
   {Browse Ack}
   {Wait Ack}
   {Browse done}
end

proc {Process MA}
   case MA of M#Ack then
      {Browse M}
      {Delay 5000}
      Ack=okay
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

declare R
R = {NewAgent0 Process}
{SyncSend R hi}
