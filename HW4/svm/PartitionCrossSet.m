function YcrossSetLabel = PartitionCrossSet(size,k)

temp = randperm(size);
YcrossSetLabel = (mod(temp,k)+1)';

end