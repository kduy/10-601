clear
clc

load 'Q2_4.mat';

Y = Q3.testErrNN-Q3.trainErrLR;
meanY = mean(Y);
[Hleft,Pleft,CIleft] = ttest(Y,meanY,'tail','left');
[Hright, Pright,CIright] = ttest(Y,meanY,'tail','right');
[Hboth,Pboth,CIboth] = ttest(Y,meanY,'tail','both');
