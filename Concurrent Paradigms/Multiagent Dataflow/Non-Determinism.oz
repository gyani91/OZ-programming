%Non-determinism - output may be either a|b|_ or b|a|_

declare S P
P={NewPort S}
{Browse S}
thread {Send P a} end
thread {Send P b} end