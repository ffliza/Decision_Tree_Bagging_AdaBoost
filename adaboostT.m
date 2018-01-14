function [trainErr, testErr] = adaboostT(train, test, itn)
initial_weight = ones(size(train,1),1)/size(train,1);
tree_root = zeros(itn,3);
error = zeros(itn,1);
a = zeros(itn,1);
for i = 1:itn
    tree_root(i,:) = decisionTree2 (train, initial_weight);
    x = (train(train(:,tree_root(i,1)+1)==0,1)~=tree_root(i,2));
    y = (train(train(:,tree_root(i,1)+1)==1,1)~=tree_root(i,3));
    ezero = initial_weight(train(:,tree_root(i,1)+1)==0);
    eone = initial_weight(train(:,tree_root(i,1)+1)==1);
    error(i) = sum(ezero(x))+sum(eone(y));
    a(i) = 0.5*log((1-error(i))/error(i));
    ezero(x) = ezero(x) * exp(a(i));
    ezero(~x) = ezero(~x) * exp(-a(i));
    initial_weight(train(:,tree_root(i,1)+1)==0) = ezero;
    eone(y) = eone(y) * exp(a(i));
    eone(~y) = eone(~y) * exp(-a(i));
    initial_weight(train(:,tree_root(i,1)+1)==1) = eone;
    initial_weight = initial_weight/sum(initial_weight);
end
trainErr = 0;
testErr = 0;
trainErr = adaboost_perf(train, tree_root, itn, a);
testErr = adaboost_perf(test, tree_root, itn, a);
trainErr = trainErr/length(train);
testErr = testErr/length(test);
end
