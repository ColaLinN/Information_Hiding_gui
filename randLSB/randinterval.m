function [row,col]=randinterval(matrix,count,key)
%计算间隔的位数
[m,n]=size(matrix);
interval1=floor(m*n/count)+1;%floor向下取整，第一个间隔
interval2=interval1-2;%第二个间隔
if interval2==0%图像的像素点数需为所存信息长度的2倍以上
    error('载体太小，不能将私密信息隐藏进去');
end
%生成随机序列
rand('seed',key);
a=rand(1,count);
%初始化
row=zeros([1 count]);
col=zeros([1 count]);
%计算row,col
r=1;
c=1;
row(1,1)=r;%row(i)的值
col(1,1)=c;
for i=2:count
    if a(i)>=0.5
        c=c+interval1;%如果随机数大于0.5，列的值加上间隔1
    else
        c=c+interval2;%反之加间隔2
    end
    if c>n%存到第几列，若c大于列数，%行数加一
        r=r+1;
        if r>m
            error('载体太小，不能私密信息隐藏进去');
        end
        c=mod(c,n);%c（mod n）的余
        if c==0
            c=1;
        end
    end
    row(1,i)=r;
    col(1,i)=c;
end