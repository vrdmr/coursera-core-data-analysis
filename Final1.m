% Storing the created matrix into multiple copies to keep a backup as well as to use it in multiple places.
l1 = [12, 987, 999; 5731,1123634, 1129365; 5743, 1124621, 1130364]
l2 = [12, 987, 999; 5731,1123634, 1129365; 5743, 1124621, 1130364]
l3 = [12, 987, 999; 5731,1123634, 1129365; 5743, 1124621, 1130364]
l4 = [12, 987, 999; 5731,1123634, 1129365; 5743, 1124621, 1130364]


% Finding the conditional probabilities and relative frequencies (out of 1.0)
for k=1:2; for i=1:2; l2(i,k) = l2(i,k)/l2(3,k); end; end;
for k=1:3; for i=1:3; l3(i,k) = l3(i,k)/l3(3,3); end; end;

l2q = l2;
for k=1:3; l2q(k,3) = l2q(k,3)/l2q(3,3); end;
for i=1:2; for j=1:2; l2qi(i,j)=((l2q(i,j)-l2q(i,2))/l2q(i,3)); end; end;

% PQ decomposition
l2qiN = l3(1:2, 1:2) .* l2qi;

%Summary QIndex
summaryQIndex = sum(sum(l3(1:2, 1:2) .* l2qi));


% Now is the Chi^2 zone.
% Creating the relative frequencies product table of the 
for i=1:3; for j=1:3; l4(i,j) = l3(i,3) * l3(3,j); end; end;

% Stores the chi2 for all the row-col combinations.
l6 = ((l3(1:2, 1:2) .- l4(1:2, 1:2)) .* (l3(1:2, 1:2) .- l4(1:2, 1:2))) ./ (l4(1:2, 1:2));

% Chi2 of the l3.
rkl = (l3(1:2, 1:2) .- l4(1:2, 1:2)) ./ (sqrt(l4(1:2, 1:2)));

summaryChi2Index = sum(sum(((l3(1:2, 1:2) .- l4(1:2, 1:2)) .** 2) ./ (l4(1:2, 1:2))));

summaryQIndex
summaryChi2Index
