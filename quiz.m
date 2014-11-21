quiz = [50     0    15    65; 0    20    15    35; 50    20    30   100]

%quiz2 =
 %   50     0    15    65
 %    0    20    15    35
 %   50    20    30   100

% nl now contains the matrix which contains the table with the objects categorized as per the taxonomies and the custom crea
nl2 = nl;

for k=1:4; nl2(4,k) = sum(nl(:,k)); end;
for k=1:3; nl2(k,5) = sum(nl(k,:)); end;
nl2(4,5) = sum(nl2(4,:));

% Storing the created matrix into multiple copies to keep a backup as well as to use it in multiple places.
nl3 = nl2;
nl4 = nl2;

% Finding the conditional probabilities and relative frequencies (out of 1.0)
for k=1:4; for i=1:3; nl2(i,k) = nl2(i,k)/nl2(4,k); end; end;
for k=1:5; for i=1:4; nl3(i,k) = nl3(i,k)/nl3(4,5); end; end;

% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
nl2q = nl2;
for k=1:3; nl2q(k,5) = nl2q(k,5)/nl2q(4,5); end;
for i=1:3; for j=1:4; nl2qindices(i,j)=((nl2q(i,j)-nl2q(l,5))/nl2q(l,5)); end; end;

% See the pq decomposition.
nl7 = nl3(1:3, 1:4) .* nl2qindices;

sw_taxa_summaryqindex = sum(sum(nl3(1:3, 1:4) .* nl2qindices));

% Now is the Chi^2 zone.
% Creating the relative frequencies product table of the 
for i=1:3; for j=1:4; nl5(i,j) = nl3(i,4) * nl3(3,j); end; end;

% Stores the chi2 for all the row-col combinations.
nl6 = ((nl3(1:3, 1:4) .- nl5) .* (nl3(1:3, 1:4) .- nl5)) ./ (nl5);

% Chi2 of the nt3.
rkl = (nl3(1:3, 1:4) .- nl5) ./ (sqrt(nl5));
sw_taxa_summarychi2index = sum(sum(((nl3(1:3, 1:4) .- nl5) .** 2) ./ (nl5)));

sw_taxa_summarychi2index
sw_taxa_summaryqindex


% For finding Q-Index, we use thus table, with p(H(k))s in the last row.
sw_taxa_summaryqindex = sum(sum(nl3(1:3, 1:4) .* nl2qindices))

% Now is the Chi^2 zone.
