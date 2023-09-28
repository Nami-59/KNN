clc;clear;
%Пакет Matlab
warning('off');
% Данные
data=readtable('C:\Users\Public\ISiT(Answers).csv');
[N,M]=size(data);
%K=5;
trainData=data(:,2:M-1).Variables; % признаки\факторы
trainClass=data(:,M).Variables; % метки классов

num_test=27; 
%Нормализация
%{ 
minValue=min(trainData);
maxValue=max(trainData);
trainData=(trainData-repmat(minValue,N,1))./(repmat(maxValue-minValue,N,1));
%}

% Оптимизация
p = 10;
K = 10;
[p_opt_min, k_opt_min, error_opt_min] = optimization(p, K, N, num_test, trainData, trainClass);
disp('Оптимальная система');
fprintf('\n')
fprintf('Оптимальная метрика p = %1.0f\n ', p_opt_min);
fprintf('Минимальное (кол-во соседей) k = %1.0f\n  ', k_opt_min);
fprintf('Ошибка = %1.5f\n  ',error_opt_min);
fprintf('\n')

% Каждая отдельная метрика
disp('Манхэттенская метрика p=1, k=5');
fprintf('\n')
error=0; p=1; K=5;
for i=num_test:N
    idx=KNN(trainData(1:num_test-1,:),trainClass(1:num_test-1,:),trainData(i,:),K,p);
    fprintf('Предсказание: %s  ',idx);
    fprintf('Исходное: %s\n',string(trainClass(i,:)));
    if idx~=string(trainClass(i,:)) %сравнение исходного и прогноза
       error=error+1;
    end
end
fprintf('Ошибка прогноза: %f\n', error/num_test);

fprintf('\n')
disp('Евклидовая метрика p=2, k=5');
fprintf('\n')
error=0; p=2; 
for i=num_test:N
    idx=KNN(trainData(1:num_test-1,:),trainClass(1:num_test-1,:),trainData(i,:),K, p);
    fprintf('Предсказание: %s  ',idx);
    fprintf('Исходное: %s\n',string(trainClass(i,:)));
    if idx~=string(trainClass(i,:)) %сравнение исходного и прогноза
       error=error+1;
    end
end
fprintf('Ошибка прогноза: %f\n', error/num_test);

fprintf('\n')
disp('Метрика Миньковского p=3, k=5');
fprintf('\n')
error=0; p=3;
for i=num_test:N
    idx=KNN(trainData(1:num_test-1,:),trainClass(1:num_test-1,:),trainData(i,:),K,p);
    fprintf('Предсказание: %s  ',idx);
    fprintf('Исходное: %s\n',string(trainClass(i,:)));
    if idx~=string(trainClass(i,:)) %сравнение исходного и прогноза
       error=error+1;
    end
end
fprintf('Ошибка прогноза: %f\n', error/num_test);