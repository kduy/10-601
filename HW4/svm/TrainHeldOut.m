function [Ypredict] = TrainHeldOut(Xtrain, Ytrain, testInstanceLabel)

countJ_Y0 = sum(Xtrain(Ytrain(testInstanceLabel==0)==-1,:))+1;
countJ_Y1 = sum(Xtrain(Ytrain(testInstanceLabel==0)==1,:))+1;

PW_Y0 = countJ_Y0./sum(countJ_Y0);
PW_Y1 = countJ_Y1./sum(countJ_Y1);
PY0 = sum(Ytrain(testInstanceLabel==0)==-1)/size(Ytrain(testInstanceLabel==0),1);
PY1 = sum(Ytrain(testInstanceLabel==0)==1)/size(Ytrain(testInstanceLabel==0),1);

Pred_Y0 = Xtrain(testInstanceLabel==1,:).*(ones(size(Xtrain(testInstanceLabel==1,:),1),1)*log10(PW_Y0));
Pred_Y1 = Xtrain(testInstanceLabel==1,:).*(ones(size(Xtrain(testInstanceLabel==1,:),1),1)*log10(PW_Y1));
Compare = [sum(Pred_Y0,2)+log10(PY0) sum(Pred_Y1,2)+log10(PY1)];
[~, Ypredict] = max(Compare,[],2);
Ypredict = Ypredict-1;

end
