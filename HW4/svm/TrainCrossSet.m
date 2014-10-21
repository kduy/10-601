function Ypredict = TrainCrossSet(Xtrain, Ytrain, crossSetLabel)
Ypredict = [];
for k=1:max(crossSetLabel)
    testInstanceLabel = zeros(size(Ytrain,1),1);
    testInstanceLabel(crossSetLabel==k,:)=1;
    Ytemp = TrainHeldOut(Xtrain, Ytrain, testInstanceLabel);
    Ypredict = [Ypredict; Ytemp];
end

end
