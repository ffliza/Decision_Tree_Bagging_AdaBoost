function [trainErr, testErr] = baggingT(train, test, iteration_numble)
    train_length = length(train);
    test_length = length(test);
    trainError = zeros(10,1);
    testError = zeros(10,1);
    for k = 1:10
            stump_root = zeros(iteration_numble,3);
            for i = 1:iteration_numble
                y = ceil(train_length.*rand(train_length,1));
                sample_data = train(y,:);
                stump_root(i,:) = decisionTree2(sample_data);
            end
    trainError(k) = bagging_perf(train, stump_root, iteration_numble);
    testError(k) = bagging_perf(test, stump_root, iteration_numble);
    end
trainErr = sum(trainError)/10/train_length;
testErr = sum(testError)/10/test_length;
end