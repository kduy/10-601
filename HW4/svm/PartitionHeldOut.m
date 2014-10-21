function [testInstanceLabel] = PartitionHeldOut(size, k)

testInstanceLabel = zeros(size,1);
testInstanceLabel(randperm(size,round(size/k)),:) = 1;

end