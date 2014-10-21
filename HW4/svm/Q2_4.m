clear
clc
load('ps4-svm.mat')

new_x = [x_test;x_train];
new_y = [y_test;y_train];

crossSetLabel = PartitionCrossSet(size(new_x,1),4);
trainErr = [];
testErr =[];

for k=1:max(crossSetLabel)
    testInstanceLabel = zeros(size(new_y,1),1);
    testInstanceLabel(crossSetLabel==k,:)=1;
    
    partitionx = new_x(testInstanceLabel==0,:);
    partitiony = new_y(testInstanceLabel==0,:);

    model = svm_train(partitionx, partitiony, C(i));
    trainErrk = [trainErrk 1-mean(model.y_train==partitiony)];
    
    predicted =  svm_classify(model, new_x(testInstanceLabel==1,:));
    testErrk = [testErrk 1-mean(predicted==new_y(testInstanceLabel==1))];
end