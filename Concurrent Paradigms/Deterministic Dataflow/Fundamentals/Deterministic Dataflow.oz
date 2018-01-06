declare X0 X1 X2 X3 in
thread X1=1+X0 end
thread X3=X1+X2 end
{Browse [X0 X1 X2 X3]} %Execute this region first


X0=4  %Now execute this line

X2=7  %Now execute this line