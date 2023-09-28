function [error_k_opt] = error(p, K, N, num_test, trainData, trainClass)

error_k = 0; 
for i=num_test:N
    idx=KNN(trainData(1:num_test-1,:),trainClass(1:num_test-1,:),trainData(i,:),K,p);
    % fprintf('Предсказание: %s  ',idx);
   % fprintf('Исходное: %s\n',string(trainClass(i,:)));
    if idx~=string(trainClass(i,:)) %сравнение исходного и прогноза
       error_k=error_k+1;
    end
end

error_k_opt = error_k/num_test;

end

