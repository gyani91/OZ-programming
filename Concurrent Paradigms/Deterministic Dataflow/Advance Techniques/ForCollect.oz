%ForCollect is a use of state(a cell) and higher-order programming
%to build a for loop abstraction that collects results

declare
proc {Exchange Acc Old New}
   @Acc=Old %Bind old end of the list to X|R2
   Acc:=New %Set Acc to new end of the list
end
   
proc {ForCollect Xs P Ys} %Xs is input and Ys is output
   Acc={NewCell Ys} %Cell Acc contains the end of the list
   proc {C X}
      R2 % New end of list
   in
      {Exchange Acc X|R2 R2} %Exchange makes the two operations atomic
      %If collector C is used in more than 1 thread,
      %doing @Acc=X|R2 and Acc:=R2 as two separate operations would permit
      %another operation on Acc to be done in between, which is wrong!
   end
in
   for X in Xs do
      {P C X}
   end
   {Exchange Acc nil _} %Bind end of the list to nil
end

local R in
   R=thread {ForCollect [1 2 3 4 5] proc {$ C X} {C X*X} end} end
   {Browse R}
end