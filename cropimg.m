function [out out1]=cropimg(c,b,rot)
[m,n,~]=size(c);
if(rot==1) 
    for i=1:n
        if(c(1,i)~=0)
            break;
        end
    end
    
    for j=1:m
        if(c(j,n)~=0)
            break;
        end
    end
    
    t=n;
    while(c(m,t)==0)
    t=t-1;
    end
    
    l=m;
    while(c(l,1)==0)
    l=l-1;
    end
    out=c(j:l,i:t);
    out1=b(j:l,i:t);
else
    for i=1:m
        if(c(i,1)~=0)
            break;
        end
    end
    
    for j=1:n
        if(c(m,j)~=0)
            break;
        end
    end
    
    t=m;
    while(c(t,n)==0)
    t=t-1;
    end
    
    l=n;
    while(c(1,l)==0)
    l=l-1;
    end
    out=c(i:t,j:l);
    out1=b(i:t,j:l);
end

