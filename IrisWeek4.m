% Matlab code for Week4

iris = load('Iris.dat');

sl = iris(:,1)
sw = iris(:,2)

a = [4 5.2 6.1 7.0 8]
b = [2 2.5 3.0 3.6 4.5]

for k=1:4;
f = find(sl >a(k) & sl <a(k+1));
g(f) = k;
end;

for k=1:4;
f = find(sw>b(k) & sw<b(k+1));
h(f) = k;
end;

for k=1:3;
f1 = (k-1)*50+1;
f2 = k*50;
t([f1:f2]) = k;
end;


for k = 1:3;
for l=1:4;
nl(k,l) = length(find(g==l & t==k));
end;
end;
