\insert 'NewAgent.oz'

declare
class BankAccount
   attr balance:0
   meth init(N) balance := N end
   meth withdraw(N)
      if @balance >= N then
	 balance := @balance - N
      end
   end
   meth deposit(N)
      balance:= @balance + N
   end
   meth balance($)
      @balance
   end
   meth otherwise(M) {Browse M} end %default
end

BP = {NewAgent BankAccount init(0)}
{BP deposit(100)}
{BP deposit(50)}
{BP withdraw(50)}
{Browse {BP balance($)}}