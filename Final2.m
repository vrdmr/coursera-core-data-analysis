% Load data from file into iris
iris = load('Iris.dat');

% Fetch the 
sl = iris(:,1);
sw = iris(:,2);

a = [4,5.2,6.1,7.0, 8.0];
b = [2,2.5,3.0,3.6,4.5];

for k=1:4; f=find(sl>= a(k) & sl<a(k+1)); g(f) = k; end;
for k=1:4; f = find(sw>=b(k) & sw<b(k+1)); h(f) = k; end;

% Table for categories sw and sl (using g and h)
for k=1:4; for l=1:4; nt(k,l) = length(find(g==l & h == k)); end; end;

% nl now contains the matrix which contains the table with the objects categorized as per the taxonomies and the custom crea
nt2 = nt;

for k=1:4; nt2(5,k) = sum(nt(:,k)); end;
for k=1:4; nt2(k,5) = sum(nt(k,:)); end;
nt2(5,5) = sum(nt2(5,:));

% Storing the created matrix into multiple copies to keep a backup as well as to use it in multiple places.
nt3 = nt2;
nt4 = nt2;

% Finding the conditional probabilities and relative frequencies (out of 1.0)
for k=1:4; for i=1:4; nt2(i,k) = nt2(i,k)/nt2(5,k); end; end;
for k=1:5; for i=1:5; nt3(i,k) = nt3(i,k)/nt3(5,5); end; end;

% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
nt2q = nt2;
for k=1:4; nt2q(k,5) = nt2q(k,5)/nt2q(5,5); end;
for i=1:4; for j=1:4; nt2qindices(i,j)=((nt2q(i,j)-nt2q(i,5))/nt2q(i,5)); end; end;

% See the pq decomposition.
nt7 = nt3(1:4, 1:4) .* nt2qindices;

sw_sl_summaryqindex = sum(sum(nt3(1:4, 1:4) .* nt2qindices));

% Now is the Chi^2 zone.
% Creating the relative frequencies product table of the 
for i=1:5; for j=1:5; nt5(i,j) = nt3(i,5) * nt3(5,j); end; end;
% Stores the chi2 for all the row-col combinations.
nt6 = ((nt3(1:4, 1:4) .- nt5(1:4, 1:4)) .* (nt3(1:4, 1:4) .- nt5(1:4, 1:4))) ./ (nt5(1:4, 1:4));

% Chi2 of the nt3.
rkl = (nt3(1:4, 1:4) .- nt5(1:4, 1:4)) ./ (sqrt(nt5(1:4, 1:4)));
sw_sl_summarychi2index = sum(sum(((nt3(1:4, 1:4) .- nt5(1:4, 1:4)) .** 2) ./ (nt5(1:4, 1:4))));

sw_sl_summarychi2index
sw_sl_summaryqindex
