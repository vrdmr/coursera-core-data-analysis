% Load data from file into iris
%iris_file = load('irisoutput.dat');
%iris_file = load('iris_1.dat');
iris_file = load('dataset_392_1.txt');

iris_dat = iris_file(:,1:4);
%iris_max = max(iris_dat);
%iris_min = min(iris_dat)
%iris_1 = iris_dat .- repmat(iris_min,size(iris_dat)(1,1),1);
%iris = 100 * (iris_1 ./ repmat(iris_max,size(iris_1)(1,1),1));
iris = iris_dat;

% Finding the data scatter
ds=sum(sum(iris .* iris));

% Finding the SVD components of iris
[z,mu,c] = svd(iris);

% Finding the relavant informations
z = z(:,1:4);
mu = mu(1:4,:);
c = c(:,1);

% Data Scatter
contrib = 100 * (mu(1,1)^2/ds)

% Alpha-calculations..
alpha = 1/sum(c);
alphaC = c .* alpha;
alphaC = transpose(alphaC);

z1 = sum(iris .* repmat(alphaC,size(iris)(1,1),1),2);
z = z1;
zmax = max(z);
zmin = min(z);

range = zmax - zmin;

z2 = z1 .- repmat(zmin,size(z1)(1,1),1);
z3 = z2 .* (100/range);

answers = [3,15,150];
z3(answers)
