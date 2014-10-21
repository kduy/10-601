function [testErr, trainErr] = run_logit()
% 10-601 HW3 starter code.
% PART 1: LOGISTIC REGRESSION
% Do not modify this file.
clear
clc

load ../data/mnist.mat

lambda = 1; % Don't change this.

[X_train, Y_train] = filter4s7s(X_train, Y_train);
[X_test, Y_test] = filter4s7s(X_test, Y_test);                 

new_x = [X_test;X_train];
new_y = [Y_test;Y_train];
crossSetLabel = PartitionCrossSet(size(new_x,1),10);

trainErr = [];
testErr =[];

    for k=1:max(crossSetLabel)
        testInstanceLabel = zeros(size(new_y,1),1);
        testInstanceLabel(crossSetLabel==k,:)=1;

        partitionx = new_x(testInstanceLabel==0,:);
        partitiony = new_y(testInstanceLabel==0,:);
        
        % train your logistic regression code.
        theta = trainLR(partitionx, partitiony, lambda); % you need to implement this function
        % make predictions.
        trainpreds = predictLR(partitionx, theta); % you need to implement this function
        Y_preds = predictLR(new_x(testInstanceLabel==1,:), theta); % you need to implement this function

        % show the test accuracy and display misclassified digits.
        traincorrects = trainpreds == partitiony;
        trainaccuracy = 100*mean(traincorrects);
        trainErr = [trainErr 100-trainaccuracy]; 
        fprintf('Train accuracy LR: %.3f%%\n', trainaccuracy);    
        
        corrects = Y_preds == new_y(testInstanceLabel==1);
        accuracy = 100*mean(corrects);
        testErr = [testErr 100-accuracy]; 
        fprintf('Logistic Regression Accuracy: %.3f%%\n', accuracy);

        % show the misclassifications.
%         if sum(not(corrects)) < 1600
%             show_centroids(X_test(not(corrects),:),28,28);
%         end
    end
end

function [X_f, Y_f] = filter4s7s(X, Y)
    X_f = X(Y == 4 | Y == 7, :);
    Y_f = Y(Y == 4 | Y == 7);
    Y_f = Y_f == 7;
end
