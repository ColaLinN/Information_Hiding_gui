function result=randlsbget(input,len_total,goalfile,key)
ste_cover=double(imread(input));
[m,n]=size(ste_cover);
S=zeros(m,n);
frr=fopen(goalfile,'w+');
[ row, col] = randinterval( ste_cover, len_total, key) ;
p=1;
data=zeros(size(ste_cover));
for i=1:len_total
	if 	bitand(ste_cover(row(i),col(i)),1)==1
        ste_cover(row(i),col(i))=256;
        data(row(i),col(i),1:3)=255;
        fwrite(frr,1,'ubit1');%ubit
		result(p,1)=1;
    else
        ste_cover(row(i),col(i))=0;
        data(row(i),col(i))=0;
        fwrite(frr,0,'ubit1');%ubit
        result(p,1)=0;
    end
        if p==len_total
            break;
        end
        p=p+1;
end
% output='photohidechange.jpg';
% ste_cover = uint8(ste_cover);
% data=uint8(data);
% imwrite(data,output) ;
% subplot( 1, 1, 1);imshow(output);title('rand_photo') ; 
fclose(frr);
end