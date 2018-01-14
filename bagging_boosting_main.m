clc
x = csvread('data/SPECT-train.csv',26,0);
x_test = csvread('data/SPECT-test.csv',26,0);
 
itn = [5, 10, 15, 20, 25, 30];
% train_error, test_error
train_error = zeros(6,2);
test_error = zeros(6,2);
 
 
 fprintf('Col:1 - Bagging'); 
for i = 1 : length(itn)
    [trainErr, testErr] = baggingT (x, x_test, itn(i));
    train_error(i,1)= trainErr;
    test_error(i,1)=testErr;
    train_accuracy(i,1) = 1- trainErr;
    test_accuracy(i,1) = 1- testErr;
end
 
 
 
 fprintf(' Col:2 - Boosting');
for i = 1 : length(itn)
    [trainErr, testErr] = adaboostT (x, x_test, itn(i));
    train_error(i,2) = trainErr;
    test_error(i,2) = testErr;
    train_accuracy(i,2) = 1- trainErr;
    test_accuracy(i,2) = 1- testErr;
end
 train_accuracy
 train_error
 fprintf('Col:1 - Bagging');
 fprintf(' Col:2 - Boosting');
 test_accuracy
 test_error
 
plot(itn,[test_error, train_error]);
title ('Training and Testing Error of bagging and adaboost');
xlabel('Ensemble Size');
ylabel('Error');
legend ('Testing Error of Bagging', 'Testing Error of Adaboost', 'Training Error of Bagging', 'Training Error of Adaboost');
 
%plot(itn,[test_accuracy, train_accuracy]);
%title ('Training and Testing Accuracy of bagging and adaboost');
%xlabel('Ensemble Size');
%ylabel('Accuracy');
%legend ('Testing Accuracy of Bagging', 'Testing Accuracy of Adaboost', 'Training Accuracy of Bagging', 'Training Accuracy of Adaboost');
 
 