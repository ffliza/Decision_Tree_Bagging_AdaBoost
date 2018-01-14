function Error = bagging_perf(data, stump_root, iteration_numble)
Error = 0;
for i = 1: length(data)
    predict = zeros (iteration_numble,1);
    for j = 1:iteration_numble
        if data(i, stump_root(j,1)+1) == 0
            predict(j) = stump_root(j,2);
        elseif data(i, stump_root(j,1)+1) == 1
            predict(j) = stump_root(j,3);
        end
    end
    datacount = zeros(2,1);
    datacount(1) = sum((predict == 0));
    datacount(2) = sum((predict == 1));
    if datacount(1) >= datacount(2)
        specificLabel = 0;
    else
        specificLabel = 1;
    end
    if specificLabel ~= data(i,1)
        Error = Error + 1;
    end
    end
end