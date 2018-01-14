function [feature_min,left,right,info_gain_chart] = decisionTree(x)

class = x(:,1);
dim = size(class);
zero_zero = 0;
zero_one =0 ;
one_zero=0;
one_one =0;

min =100;
zero_class =0;
for i = 1:dim(1)
    if(class(i,1)==0)
        zero_class = zero_class +1;
    end
end
one_class = dim(1) - zero_class;
root_node_info = 1;
for j = 2:23  %for each feature (total 22 features)
    f1 = x(:,j);
    feature_value = j-1;
    zero_zero = 0;
    zero_one =0 ;
    one_zero=0;
    one_one =0;
    for i = 1:dim(1)
        if(class(i,1)==0 && f1(i,1)==0)
            zero_zero = zero_zero +1;
        end
        if(class(i,1)==1 && f1(i,1)==0)
            zero_one = zero_one +1;
        end
        if(class(i,1)==0 && f1(i,1)==1)
            one_zero = one_zero +1;
        end
        if(class(i,1)==1 && f1(i,1)==1)
            one_one = one_one +1;
        end
    end
    d1 = zero_zero + zero_one;
    d2 = one_zero + one_one;
    H_y_f_0 = (-zero_zero/d1)*log2(zero_zero/d1) +(-zero_one/d1)*log2(zero_one/d1);
    H_y_f_1 = (-one_zero/d2)*log2(one_zero/d2) +(-one_one/d2)*log2(one_one/d2);
    
    count = 0;
    for k=1:80
        if (f1(k)==0)
            count = count +1;
        end
    end
    p_f_0 = count/80;
    p_f_1 = 1- p_f_0;
    
    H_y_f = p_f_0*H_y_f_0 +p_f_1*H_y_f_1;
    information_gain = root_node_info - H_y_f;
    info_gain_chart(j,1)= feature_value;
    info_gain_chart(j,2)= information_gain;
    
    if (min > H_y_f)
        feature_min = j-1;
        min = H_y_f;
        if (zero_zero >= zero_one)
            left = 0;
        else 
            left = 1;
        end
        if(one_zero >= one_one)
            right = 0;
        else 
            right =1;
        end
    end
end	




