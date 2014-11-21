% Load data from file into iris
%iris_file = load('irisoutput.dat');
iris_file = load('iris_1.dat');

iris_dat = iris_file(:,1:4);
iris_max = max(iris_dat);
iris_min = min(iris_dat);
iris_temp = iris_dat .- repmat(iris_min,size(iris_dat)(1,1),1);

iris = iris_temp *100 ./ repmat(iris_max,size(iris_temp)(1,1),1);
ds=sum(sum(iris.*iris));

[z,mu,c] = svd(iris);

z = z(:,1:4);
mu = mu(1:4,:);
C = c(:,1);

alpha = 1/sum(C);
alphaC = C .* alpha;
alphaC = transpose(alphaC);

answers = [5,10,15];

for i = 1:size(answers)(1,2);
z = 0;
temp = iris(answers(i),:)
for j = 1:size(iris)(1,2);
z = z + temp(1,j) * alphaC(1,j);
end;
z
end;


