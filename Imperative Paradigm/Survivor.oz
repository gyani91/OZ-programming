%If X number of people are standing in a circle
%and 1 kills 2 and handover the sword to 3 and 3 kills 4 gives the sword to 5
%so on. Evaluate the number of the survivor


declare
fun {Final X}
   local P={NewCell 1} in
      fun {FinalAux P A}
	 if @P==1 then
	    case A of H1|H2|T then H1|{FinalAux P T}
	    [] X|nil then P:=0 X|nil
	    [] nil then nil
	    end
	 else
	    case A of H1|H2|T then H2|{FinalAux P T}
	    [] X|nil then P:=1 nil
	    [] nil then nil
	    end
	 end
      end
      fun {Init X A}
	 if A<X+1 then A|{Init X A+1}
	 else nil end
      end
      fun {Eval A}
	 case A of X|nil then X
	 else
	    %{Browse A}
	    {Eval {FinalAux P A}}
	 end
      end
   end
in
   {Eval {Init X 1}} 
end

{Browse {Final 100}}