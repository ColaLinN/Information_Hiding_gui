function [ste_cover,len_total]=randanhide(input,file,output,key,a)
cover = imread( input) ;
ste_cover = cover; 
ste_cover = double( ste_cover) ;
fid=fopen(file,'w+');%打开read文件把文本框信息写入
fprintf(fid,'%s',a);
fclose(fid);
f_id = fopen( file, 'r') ; 
[ msg, len_total] = fread( f_id,'ubit1') ;
[ m, n] = size( ste_cover) ; 
if len_total > m* n 
	error('嵌入消息量过大, 请更换图像') ; 
end
p = 1;
[ row, col] = randinterval(ste_cover,len_total,key) ;
for i=1:len_total 
	ste_cover(row(i),col(i)) = ste_cover(row(i),col(i))-mod(ste_cover(row(i),col(i)),2)+msg(p,1);
	if p == len_total 
		break; 
	end
	p = p + 1;
end
ste_cover = uint8(ste_cover);
imwrite(ste_cover,output) ;
% subplot( 1, 2, 1);imshow(cover);title('o') ; 
% subplot( 1, 2, 2);imshow(output);title('h') ;
end