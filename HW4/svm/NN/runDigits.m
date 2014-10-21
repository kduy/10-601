function [trainErr, testErr] = runDigits()
% Trains a single layer NN on a subset of the MNIST set and evaluates the
% NN.
    clear
    clc
    
    addpath ./helpers

    load ../data/mnist.mat

    % don't change the parameters in this file.
    % we get ~94.8% accuracy with these parameters.
    n_classes = 10;
    opt.hidden_sizes = 64;
    opt.lambda = 0.1;
    
    opt.MaxIter = 400; % max iterations for minimization function.
    
    opt.beta = 0.0;
    opt.p = 0.01;
    
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
        
        % add 1 to labels so that they are in 1:10, instead of 0:9
        theta = nnTrainClassification(partitionx, partitiony+1, opt);
        
        % show the accuracy.
        trainpreds = nnPredictClassification(partitionx, theta, n_classes, opt);

        preds = nnPredictClassification(new_x(testInstanceLabel==1,:), theta, n_classes, opt);
    
        % dont forget to subtract 1 from the labels we added to earlier!
        traincorrects = trainpreds-1 == (partitiony');
        trainaccuracy = 100*mean(traincorrects);
        trainErr = [trainErr 100-trainaccuracy]; 
        fprintf('Train accuracy NN: %.3f%%\n', trainaccuracy);

        corrects = preds-1 == (new_y(testInstanceLabel==1)');
        accuracy = 100*mean(corrects);
        testErr = [testErr 100-accuracy]; 
        fprintf('Test accuracy NN: %.3f%%\n', accuracy);
    
        % show the misclassifications.
        if sum(not(corrects)) < 1600
            show_centroids(X_test(not(corrects),:),28,28);
        end
    end
end