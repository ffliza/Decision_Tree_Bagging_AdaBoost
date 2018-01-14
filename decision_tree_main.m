 clc
 x = csvread('data/SPECT-train.csv',26,0);
 x_test = csvread('data/SPECT-test.csv',26,0);
 type = 1; % decision stumps
 %decision tree stump
 [best_feature,left_value,right_value,info_gain_chart] = decisionTree(x); % best feature = 13 means, 14 number column in the dataset
 info_gain_chart
 decision_stump = best_feature
 [accuracy_train]=test_decision_stump(best_feature,left_value,right_value,x)
 [accuracy_test]=test_decision_stump(best_feature,left_value,right_value,x_test)
 
 
 
 

 