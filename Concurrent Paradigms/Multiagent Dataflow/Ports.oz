declare
S P = {NewPort S}
{Browse S} %feed region

for E in S do
   {Browse E}
   case E of pair(r X) then X = ok
   else skip end
end %feed region

{Send P a} %feed line
{Send P b} %feed line

declare R
{Browse R}%feed region
{Send P pair(r R)}%feed line