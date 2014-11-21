% Load data from file into iris
iris = load('irisoutput.dat');

iris = iris(:,1:4);

[z,mu,c] = svd(iris);

z = z(:,1:4);
mu = mu(1:4,:);

c1 = sqrt(mu(1,1)) * c(1,1)
c2 = sqrt(mu(1,1)) * c(2,1)
c3 = sqrt(mu(1,1)) * c(3,1)
c4 = sqrt(mu(1,1)) * c(4,1)

z1 = sqrt(mu(1,1)) * z(5,1)
z2 = sqrt(mu(1,1)) * z(10,1)
z3 = sqrt(mu(1,1)) * z(15,1)

ds=sum(sum(iris.*iris));
contrib = mu(1,1) .** 2 / ds;

contrib * 100
