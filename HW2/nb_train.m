function [model] = nb_train(Xtrain, Ytrain)

countJ_Y0 = sum(Xtrain(Ytrain==0,:))+1;
countJ_Y1 = sum(Xtrain(Ytrain==1,:))+1;

PW_Y0 = countJ_Y0./sum(countJ_Y0);
PW_Y1 = countJ_Y1./sum(countJ_Y1);
PY0 = sum(Ytrain==0)/size(Ytrain,1);
PY1 = sum(Ytrain==1)/size(Ytrain,1);

model = struct('PW_Y0',PW_Y0,'PW_Y1',PW_Y1,'PY0',PY0,'PY1',PY1);
end
