function [accuracy] = test_decision_stump(best_feature,left_value,right_value,x_test)
row = size(x_test,1);
class_t = x_test(:,1);
correct =0;
misclassify =0;
for i = 1:row
    if(x_test(i,best_feature+1)==0)
        predicted_class = left_value;
    else
        predicted_class = right_value;
    end
    if( predicted_class == class_t(i))
        correct = correct +1;
    else 
        misclassify = misclassify +1;
    end
end

accuracy = correct /row;
