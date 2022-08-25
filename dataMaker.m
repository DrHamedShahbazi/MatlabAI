

%in the name of the most High
%prepare Dataset for system identification

x1 =[ 0: 1 : 50];
x2 =[ 0: 1 : 50];
x3 =[ 0: 1 : 50];

[m n]=size(x1);
inputDataSet = [];
outPutDataSet =[];
for i = 1: n
   for j = 1: n
       for k = 1: n           
          y = systemBBox([x1(i) x2(j)  x3(k)]);
          inputDataSet = [inputDataSet ; x1(i) x2(j)  x3(k)];
          outPutDataSet = [outPutDataSet;y];
       end
   end
end
          
           