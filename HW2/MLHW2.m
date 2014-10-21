%Question 4a
Y = ones(101,1);
X = ones(101,2);
X(101,2) = 0;

B = regress(Y,X)

%Question 4b
Y(102:103,1) = 1;
X(102:103,1) = 0;
X(102:103,2) = 1;

newB = regress(Y,X)