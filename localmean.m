function [d]=localmean(mean1,m)
c(ceil(m/5),1)=0;
d(1,m)=0;
q=0;
q1=1;
q2=ceil(m/5);
for j=1:5
    l=1;
    for i=q1:q2
        c(l,1)=mean1(i,1);
        l=l+1;
    end
    f=c(:);
%     figure,plot(f)
    [pks2,locs2]=findpeaks(f);
    [~,peaks]=size(locs2);
    maxvalue=max(pks2);
    for k=1:peaks
        if(pks2(1,k)==maxvalue)
            d(1,(locs2(1,k)+q))=1;
            peaks=peaks+1;
        end
    end
    if(q2~=m)
        q=q2;
        q1=q2+1;
        q2=q2+ceil(m/5)-1;
    else 
        break;
    end
end


