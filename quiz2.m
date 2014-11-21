nt = [169, 21, 140, 330; 83, 25, 68, 176; 286, 10, 28, 324; 538, 56, 236, 830]

% nl now contains the matrix which contains the table with the objects categorized as per the taxonomies and the custom crea
nt2 = nt;

%for k=1:3; nt2(4,k) = sum(nt(:,k)); end;
%for k=1:4; nt2(k,4) = sum(nt(k,:)); end;
%nt2(5,5) = sum(nt2(4,:));

% Storing the created matrix into multiple copies to keep a backup as well as to use it in multiple places.
nt3 = nt2;
nt4 = nt2;

% Finding the conditional probabilities and relative frequencies (out of 1.0)
for k=1:3; for i=1:3; nt2(i,k) = nt2(i,k)/nt2(4,k); end; end;
for k=1:4; for i=1:4; nt3(i,k) = nt3(i,k)/nt3(4,4); end; end;

% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
nt2q = nt2;
for k=1:3; nt2q(k,4) = nt2q(k,4)/nt2q(4,4); end;
for i=1:3; for j=1:3; nt2qindices(i,j)=((nt2q(i,j)-nt2q(i,4))/nt2q(i,4)); end; end;

% See the pq decomposition.
nt7 = nt3(1:3, 1:3) .* nt2qindices;

sw_sl_summaryqindex = sum(sum(nt3(1:3, 1:3) .* nt2qindices));

sw_sl_summaryqindex


% Now is the Chi^2 zone.
% Creating the relative frequencies product table of the 
for i=1:3; for j=1:3; nt5(i,j) = nt3(i,4) * nt3(4,j); end; end;
% Stores the chi2 for all the row-col combinations.
nt6 = ((nt3(1:3, 1:3) .- nt5(1:3, 1:3)) .* (nt3(1:3, 1:3) .- nt5(1:3, 1:3))) ./ (nt5(1:3, 1:3));

% Chi2 of the nt3.
rkl = (nt3(1:3, 1:3) .- nt5(1:3, 1:3)) ./ (sqrt(nt5(1:3, 1:3)));
sw_sl_summarychi2index = sum(sum(((nt3(1:3, 1:3) .- nt5(1:3, 1:3)) .** 2) ./ (nt5(1:3, 1:3))));
