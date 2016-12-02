function [G,e] = compute_GLCM(f,o)
G=zeros(256,256);
[r,c]=size(f);
dx=o(1);
dy=o(2);
e=0;
for i=1:r-dx
    for j=1:c-dy
        I1=f(i,j)+1;
        I2=f(i+dx,j+dy)+1;
        G(I1,I2)=G(I1,I2)+1;
    
    end
end

for i=1:256
    for j=1:256
        e=e-G(i,j)*log2(G(i,j));
    end
end
end