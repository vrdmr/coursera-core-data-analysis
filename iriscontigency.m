% Load data from file into iris
iris = load('Iris.dat');

% Fetch the 
sl = iris(:,1);
sw = iris(:,2);

a = [4,5.2,6.1,7.0, 8.0];
b = [2,2.5,3.0,3.6,4.5];

for k=1:4; f=find(sl>= a(k) & sl<a(k+1)); g(f) = k; end;
for k=1:4; f = find(sw>=b(k) & sw<b(k+1)); h(f) = k; end;

for k=1:3; f1 = (k-1)*50+1; f2=k*50; t([f1:f2])=k; end;

% Table for categories sl and taxo (using g and t)
for k=1:3; for l=1:4; nl(k,l) = length(find(g==l & t == k)); end; end;

% Table for categories sw and sl (using g and h)
for k=1:4; for l=1:4; nt(k,l) = length(find(g==l & h == k)); end; end;

% nl now contains the matrix which contains the table with the objects categorized as per the taxonomies and the custom crea
nl2 = nl;
nt2 = nt;

for k=1:4; nl2(4,k) = sum(nt(:,k)); end;
for k=1:3; nl2(k,5) = sum(nt(k,:)); end;
nl2(4,5) = sum(nl2(4,:));

for k=1:4; nt2(5,k) = sum(nt2(:,k)); end;
for k=1:4; nt2(k,5) = sum(nt2(k,:)); end;
nt2(5,5) = sum(nt2(5,:));

% Storing the created matrix into multiple copies to keep a backup as well as to use it in multiple places.
nl3 = nl2;
nl4 = nl2;

nt3 = nt2;
nt4 = nt2;

% Finding the conditional probabilities and relative frequencies (out of 1.0)
for k=1:4; for i=1:3; nl2(i,k) = nl2(i,k)/nl2(4,k); end; end;
for k=1:5; for i=1:4; nl3(i,k) = nl3(i,k)/nl3(4,5); end; end;

for k=1:4; for i=1:4; nt2(i,k) = nt2(i,k)/nt2(5,k); end; end;
for k=1:5; for i=1:5; nt3(i,k) = nt3(i,k)/nt3(5,5); end; end;

% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
nl2q = nl2;
for k=1:3; nl2q(k,5) = nl2q(k,5)/nl2q(4,5); end;
for i=1:3; for j=1:4; nl2qindices(i,j)=((nl2q(i,j)-nl2q(l,5))/nl2q(l,5)); end; end;

% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
nt2q = nt2;
for k=1:4; nt2q(k,5) = nt2q(k,5)/nt2q(5,5); end;
for i=1:4; for j=1:4; nt2qindices(i,j)=((nt2q(i,j)-nt2q(i,5))/nt2q(i,5)); end; end;

summaryqindex = sum(sum(nt3(1:4, 1:4) .* nt2qindices))
