\insert 'NewAgent.oz'

declare
class Ball
   attr n:0 i:0 agents:nil
   meth init(N I Agents)
      n := N i := I agents := Agents
   end
   meth ball
      if @n > 0 then
	 {Inspect gotBall(agent(@i) @n)}
	 n := @n-1
	 {Delay 1000}
	 {{Nth @agents (@i mod {Length @agents}) + 1} ball}
      end
   end
end

Bs = for I in 1..4 collect: C do
	{C {NewAgent Ball init(10 I Bs)}}
     end
{Bs.1 ball}