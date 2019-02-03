function phase2(v)
fileID=fopen('output1.txt','w');
[m,n,~]=size(v);
 
% Adjust contrast of the image
v=imadjust(v);
 
% calculate Row-wise mean
mean1=mean(v,2);
mean1SM=smooth((mean1/255),ceil(m/30),'moving');
 [pks,locs]=findpeaks(mean1SM);
[~,peaks]=size(locs);
maxvalue=max(pks);
b=1;
l=v;
if(peaks~=0)
for i=1:peaks
    if(pks(1,i)>=(maxvalue-0.1))
        k=locs(1,i)-b+1;
        
        % Finer vertical band clipping
        h=imcrop(l,[1 b n k]);
        
        % Adjust contrast of the image
        h=imadjust(h);
        if((locs(1,i)-b)>=ceil(0.1*m))
            [d,f,~]=size(h);
            
            % Adaptive thresholding
            im2=logical(meanthresh(h,[d d]));
            mean2=mean(im2);
            maxvalue1=max(mean2);
            q1=1;
            while(mean2(1,q1)<(maxvalue1-0.1))
                q1=q1+1;
                if(q1==f)
                    q1=-1;
                    break;
                end
            end
            q2=f;
            while(mean2(1,q2)<(maxvalue1-0.1))
                q2=q2-1;
                if(q2==1)
                    q2=-1;
                    break;
                end
            end
            if((q1~=-1) || (q2~=-1))
            
            % Finer horizontal band clipping
            im3=im2(:,abs(q1):abs(q2)); 
            h1=imcomplement(im3);
            
            % Detect titl angle of finely cropped ROI
            [H,theta,~]=hough(h1);
            peaks=houghpeaks(H,1);
            ang=theta(peaks(:,2));
            if(ang>0)
                h1=imrotate(h1,(ang)-90,'crop');
            else
                h1=imrotate(h1,(90-abs(ang)),'crop');
            end
            [L,num]=bwlabel(h1,8);
            val=24;
            thres=4.2;
            
            % Segmentation of individual characters using connected 
            % components
            for k=1:num
                [r c]=find(L==k);
                minrow=min(r);
                mincol=min(c);
                maxrow=max(r);
                maxcol=max(c); 
                v=maxcol-mincol;
                c=maxrow-minrow;
                    if(((c/v)<=thres)&&(c>=ceil(n/val))&&((c/v)>=0.6))
                        h2=h1(minrow:maxrow,mincol:maxcol);
                        
                        % Send segmented characters to phase3 for recognition 
                        t=phase3(h2);
%                         if(update1<=update+1)
%                         update1=update1+1;
%                         end
%                         subplot(1,update,update1);imshow(h2)
                      if((('0'<=t)&&(t<='9'))||(('A'<=t)&&(t<='Z'))&&(t~=0) ) 
                            fprintf(fileID,'%c',t);
                      end
                    end
             end
            end
        end
         b=locs(1,i);
    end
end 
end
s=dir('C:\Users\srihari\Desktop\ANPR3\output1.txt');
if((s.bytes~=0)&&(s.bytes>4)) 
    
    % write the recognized characters to a .txt file
    y=fileread('output1.txt');
    fileID=fopen('output.txt','w');
    fprintf(fileID,'%s',y);
    
end              
                
                

