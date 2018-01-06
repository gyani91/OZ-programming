declare
proc {Disp S}
   case S of X|S2 then {Browse X}{Disp S2} end
end

declare S
thread {Disp S} end  %Execute this region

declare S2 in S=a|b|c|S2 %Now execute this line
declare S3 in S2=d|e|f|S3 %Now execute this line
S3=[7] %Now execute this line