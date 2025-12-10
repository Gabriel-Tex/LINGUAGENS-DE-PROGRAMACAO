declare A B C D in
thread D=C+1 end
thread C=B+1 end
thread A=1 end
thread B=A+1 end
{Browse D}

declare A B C D in
A=1
B=A+1
C=B+1
D=C+1
{Browse D}