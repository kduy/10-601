clear
clc
load('ps4-svm.mat')

C = 0.5;

new_x = [x_test;x_train];
new_y = [y_test;y_train];

%2 partitions
[testInstanceLabel2] = PartitionHeldOut(size(new_x,1), 2);

partition2x = new_x(testInstanceLabel2==0,:);
partition2y = new_y(testInstanceLabel2==0,:);

model2 = svm_train(partition2x, partition2y, 0.5);
predicted2 =  svm_classify(model2, new_x(testInstanceLabel2==1));
[Accuracy295, lowerInterval295, upperInterval295] = ConstructInterval(predicted2,new_y(testInstanceLabel2==1),.95)
[Accuracy299, lowerInterval299, upperInterval299] = ConstructInterval(predicted2,new_y(testInstanceLabel2==1),.99)

%10 partitions
[testInstanceLabel10] = PartitionHeldOut(size(new_x,1), 10);

partition10x = new_x(testInstanceLabel10==0,:);
partition10y = new_y(testInstanceLabel10==0,:);

model10 = svm_train(partition10x, partition10y, 0.5);
predicted10 =  svm_classify(model10, new_x(testInstanceLabel10==1));
[Accuracy1095, lowerInterval1095, upperInterval1095] = ConstructInterval(predicted10,new_y(testInstanceLabel10==1),.95)
[Accuracy1099, lowerInterval1099, upperInterval1099] = ConstructInterval(predicted10,new_y(testInstanceLabel10==1),.99)
