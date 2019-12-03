function [row,col]=randinterval(matrix,count,key)
%��������λ��
[m,n]=size(matrix);
interval1=floor(m*n/count)+1;%floor����ȡ������һ�����
interval2=interval1-2;%�ڶ������
if interval2==0%ͼ������ص�����Ϊ������Ϣ���ȵ�2������
    error('����̫С�����ܽ�˽����Ϣ���ؽ�ȥ');
end
%�����������
rand('seed',key);
a=rand(1,count);
%��ʼ��
row=zeros([1 count]);
col=zeros([1 count]);
%����row,col
r=1;
c=1;
row(1,1)=r;%row(i)��ֵ
col(1,1)=c;
for i=2:count
    if a(i)>=0.5
        c=c+interval1;%������������0.5���е�ֵ���ϼ��1
    else
        c=c+interval2;%��֮�Ӽ��2
    end
    if c>n%�浽�ڼ��У���c����������%������һ
        r=r+1;
        if r>m
            error('����̫С������˽����Ϣ���ؽ�ȥ');
        end
        c=mod(c,n);%c��mod n������
        if c==0
            c=1;
        end
    end
    row(1,i)=r;
    col(1,i)=c;
end