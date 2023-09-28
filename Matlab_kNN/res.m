function [k_opt,error_opt] = res(p, K, N, num_test, trainData, trainClass)

k_opt = zeros(1,p);
error_opt = zeros(1,p);

for i=1:p
    error_opt_new = 1.1;
    for j=1:K
       % disp(j);
        error_k = error(i, j, N, num_test, trainData, trainClass);
        if error_opt_new > error_k
            error_opt_new = error_k;
            k_opt_new = j;
        end
    end
    k_opt(i) = k_opt_new;
    error_opt(i)=error_opt_new;
end

end

