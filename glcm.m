clear;clc; close all;

prefix = {'Bark', 'Bush', 'Fabric', 'Floor', 'Flower', 'Food', 'Gravel', 'Hair', 'Marble', 'Metal', 'Paint' };
o=[20 20];
e=zeros(11,9);

for j=1 : 11
    for i=1 : 9
        fn = sprintf ( 'data/%s.%d.png', prefix{j}, i );
        f=imread(fn);
%         figure, imshow(f);
        G=compute_GLCM(f,o);
%        figure;imshow(G,[]); title('glcm with o as [100 100]');
        e(j,i)=-compute_entropy(G);
    end
end

diff=zeros(11,9);
count=0;

for j=1:11
    for i=1:9        
        diff = abs(e(j,i) - e);       
        [~, orig(:,:)] = sort( diff(:)); %, 'ascend' );
        [pre, ~] = ind2sub(size(diff),orig(2));

        if(pre == j)
            count = count+1;
        end
    end
end

acc= (count / (11*9))*100;
display(acc);