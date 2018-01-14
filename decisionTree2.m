function stump = decisionTree2(data ,weight)
stump = zeros(1, 3);
feature_number = size(data, 2) - 1;
information_gain = zeros(1, feature_number);
if (nargin == 1)
    information_gain = calculate_information_gain(data);
else
    information_gain = calculate_information_gain(data, weight);
end
[~,fNum] = min(information_gain);
stump(1) = fNum;
if nargin == 1
    tt = tabulate(data(data(:,fNum+1)==0,1));
    [~, t] = max (tt(:,end));
    stump(2) = tt(t,1);
    ss = tabulate(data(data(:,fNum+1)==1,1));
    [~, s] = max (ss(:,end));
    stump(3) = ss(s,1);
elseif nargin == 2
    tempData0 = data(data(:,fNum+1)==0,1);
    tempData1 = data(data(:,fNum+1)==1,1);
    weight0 = weight(data(:,fNum+1)==0);
    weight1 = weight(data(:,fNum+1)==1);
    result_weight = zeros(2,2);
    result_weight (1,1) = sum(weight0(tempData0==0));
    result_weight (1,2) = sum(weight0(tempData0==1));
    result_weight (2,1) = sum(weight1(tempData1==0));
    result_weight (2,2) = sum(weight1(tempData1==1));
    [~ , index] = max(result_weight, [], 2);
    stump (2:3) = index - 1;
end