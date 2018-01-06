declare
class Queue
   attr q
   meth init q:=nil end
   meth size($) {Length @q} end
   meth isEmpty($) @q==nil end
   meth front($)
      if {self isEmpty($)} then
	 raise frontQueueEmpty end
      else @q.1 end
   end
   meth enqueue(X) q:={Append @q X|nil} end
   meth dequeue($)
       if {self isEmpty($)} then
	  raise queueEmpty end
       else local X in
	       X=@q.1
	       q:=@q.2
	       X
	    end
       end
   end
end

local S={New Queue init}  in
   {Browse {S size($)}}
   {Browse {S isEmpty($)}}
   %{Browse {S top($)}}
   {S enqueue(8)}
   {S enqueue(7)}
   {Browse {S size($)}}
   {Browse {S isEmpty($)}}
   {Browse {S front($)}}
   {Browse {S dequeue($)}}
   {Browse {S size($)}}
   {Browse {S front($)}}
   %{Browse {S pop($)}}
end