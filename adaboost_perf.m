function Error = adaboost_perf(data, tree_root, iteration_number, a)
Error = 0;
for i = 1:length(data)
    result_labell = zeros (iteration_number,1);
    for j = 1:iteration_number
        if data(i, tree_root(j,1)+1) == 0
            result_labell(j) = tree_root(j,2);
        elseif data(i, tree_root(j,1)+1) == 1
            result_labell(j) = tree_root(j,3);
        end
    end
    result_count = zeros(2,1);
    result_count(1) = sum(a(result_labell == 0));
    result_count(2) = sum(a(result_labell == 1));
    if result_count(1) >= result_count(2)
        predict = 0;
    else
        predict = 1;
    end
    if predict ~= data(i,1)
        Error = Error + 1;
    end
    end
end

    

