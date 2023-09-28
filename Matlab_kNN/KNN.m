function [ idx ] = KNN(trainData,trainClass,testData, K, p)

[N,M]=size(trainData);

%Расчет метрики
dist=zeros(N,1);
for i=1:N
    dist(i,:)=norm(trainData(i,:) - testData, p);
end

%Сортировка расстояния по возрастанию
[Y,I]=sort(dist,1); % I индекс; Y расстояние
K=min(K,length(Y));
labels=trainClass(I);

%Выбор наиболее часто встречающегося значения
[s,~,j]=unique(labels(1:K));
idx = s{mode(j)}; 

end
