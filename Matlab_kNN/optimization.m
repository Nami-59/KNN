function [p_opt_min, k_opt_min, error_opt_min] = optimization(p, K, N, num_test, trainData, trainClass)

[k_opt, error_opt] = res(p, K, N, num_test, trainData, trainClass);
min_error=min(error_opt);
index=min(find(error_opt==min_error));
p_opt_min = index;
k_opt_min = k_opt(index);
error_opt_min = error_opt(index);

end

