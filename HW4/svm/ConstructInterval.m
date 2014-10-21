function  [Accuracy, lowerInterval, upperInterval] = ConstructInterval(Ypredict,Ytest,confLevel)

if(confLevel==.99)
    Zn = 2.576;
elseif(confLevel==.95)
    Zn = 1.96;
end

Accuracy = mean(Ypredict==Ytest);
n = max(size(Ytest));
lowerInterval = Accuracy-Zn*sqrt((Accuracy*(1-Accuracy))/n);
upperInterval = Accuracy+Zn*sqrt((Accuracy*(1-Accuracy))/n);
end