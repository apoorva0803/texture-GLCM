function [e] = compute_entropy(G)
    sum=0;e=0;
    for i=1:256
        for j=1:256
            sum=sum+G(i,j);
        end
    end        
    for i=1:256
        for j=1:256
            if G(i,j)~=0
                p=G(i,j)/sum;
                e=e+p*log2(p);
            end
        end
    end
end