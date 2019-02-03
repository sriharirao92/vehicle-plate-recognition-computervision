
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  
%                                                                       % 
%                 AUTOMATIC LICENSE PLATE RECOGNITION                   % 
%                                                                       % 
%       Written by: Srihari R                Date:05-052014             %
%                   Yogesh P                                            % 
%                   Venukumar B V                                       % 
%                   Anand N                                             % 
%                                                                       %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                              Phase 1                                  %
%    This phase provides the License plate region in the whole Image.   %
%                                                                       %
%    The captured real time image of a vehicle license plate is given   %
%    as the input(phase1_in) to this phase. The output(phase1_out) will %
%    be the cropped image of the input image, which contains only the   %
%    region of license plate and this image is sent to phase2.          %
%                                                                       %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
 
 
function phase1(a)
tic
[~,n,~]=size(a);
sout=2;
 
% convert to grayscale
b=rgb2gray(a);
 
% improve contrast of image
b=imadjust(b);
 
% adaptive thresholding
c=imcomplement(meanthresh(b,[50 50]));
% figure,imshow(b)
% figure,imshow(c)
 
% detect the tilt angle using Hough transforms
[H,theta,~]=hough(c);
peaks=houghpeaks(H,5);
re=sort(theta(peaks(:,2)));
rePos=0;
reNeg=0;
k1=1;
k2=1;
for i1=1:length(re)
    if(re(i1)>60)
        rePos(k1)=re(i1);
        k1=k1+1;
%         countpos=countpos+1;
    elseif(re(i1)<(-60))
        reNeg(k2)=re(i1);
        k2=k2+1;
%         countneg=countneg+1;
    end
end
 
m=0;
count1=0;
if(length(rePos)>length(reNeg))
    q(length(rePos))=0;
    for i2=1:length(rePos)-1
        q(i2)=rePos(i2+1)-rePos(i2);
    end
    q(i2+1)=q(i2);
    for i3=1:length(rePos)
        if(q(i3)<5)
            m = m + rePos(i3);
            count1=count1+1;
        end
    end
    ang=ceil(m/count1);
else
    q(length(reNeg))=0;
    for i2=1:length(reNeg)-1
        q(i2)=reNeg(i2+1)-reNeg(i2);
    end
    q(i2+1)=q(i2);
    for i3=1:length(reNeg)
        if(q(i3)<5)
            m = m + reNeg(i3);
            count1=count1+1;
        end
    end
    ang=floor(m/count1);
end
 
% Tilt and shear correction 
% If 90-abs(ang)>1 
%     Implies presence of tilt
% else
%     No tilt
if(90-abs(ang)>1)
    if(ang>=0) 
        c2=imrotate(c,90,'crop');
        
        % Horizontal edge detection using Sobel edge detector
        c2=edge(c2,'sobel',0.4,'horizontal');
        
        % Detect the angle of shear using Hough transform
        [H1,theta1,~]=hough(c2);
        peaks1=houghpeaks(H1,200);
        ang1=sort(theta1(peaks1(:,2)));
        h4=abs(ang-abs(ang1));
        e=min(h4);
        
        % Tilt correction
        c=imrotate(c,(ang)-90,'crop');
        b=imrotate(b,(ang)-90,'crop');
        
        % Calculate tform for affine transform
        T=[1 0 0;tand(e) 1 0;0 0 1];
        [b c]=cropimg(b,c,1);
        
        % Shear correction
        tform1=maketform('affine',T);
        b=imtransform(b,tform1,'size',size(b));
        % figure,imshow(b1)
        c=imtransform(c,tform1,'size',size(c));
        [b c]=shearcrop(b,c);
        % figure,imshow(b1)
 
    else
        
       c2=imrotate(c,-90,'crop');
        
        % Horizontal edge detection using Sobel edge detector
        c2=edge(c2,'sobel',0.4,'horizontal');
        
        % Detect the angle of shear using Hough transform
        [H1,theta1,~]=hough(c2);
        peaks1=houghpeaks(H1,200);
        ang1=sort(theta1(peaks1(:,2)));
        h4=abs(-ang-abs(ang1));
        e=min(h4);
        
        % Tilt correction
        c=imrotate(c,(90-abs(ang)),'crop');
        b=imrotate(b,(90-abs(ang)),'crop');
        
        % Calculate tform for affine transform
        T=[1 0 0;-tand(e) 1 0;0 0 1];
        [b c]=cropimg(b,c,0);
        
        % Shear correction
        tform1=maketform('affine',T);
        b=imtransform(b,tform1,'size',size(b));
        % figure,imshow(b1)
        c=imtransform(c,tform1,'size',size(c));
        [b c]=shearcrop(b,c);
        % figure,imshow(b1)
    end
end
% figure,imshow(b)
 
mean1=mean(c,2);
[w,~,~]=size(c);
% figure,plot(mean1);
 
% Finding dominant local peaks
[d]=localmean(mean1,w);
% figure,plot(d)
[pks,locs]=findpeaks(d);
[~,peaks]=size(locs);
z=1;
for i=1:peaks
    if(pks(1,i)==1)
        k=locs(1,i)-z+1;
        
        % Vertical band clipping
        h=imcrop(b,[1 z n k]);
        h=imadjust(h);
        [m1,~,~]=size(h);
%         figure,imshow(h)
 
        % Find column-wise mean of band clipped image 
        mean2=mean(h);
        mean2SM=diff(smooth(mean2/255,ceil(m1/10)));
%         figure,plot(mean2SM);
        [~,q1]=max(mean2SM);
        [~,q2]=min(mean2SM);
        
        % Horizontal band clipping
        if((q1>q2)&&((q1-q2)>n/10))
            h1=h(:,q2:q1);
%             figure,imshow(h1)
            
              % Send ROI to phase 2
              sout=phase2(h1);
        elseif ((q1<q2)&&((q2-q1)>n/10))
            h1=h(:,q1:q2);
%             figure,imshow(h1)
            
              % Send ROI to phase 2
              sout=phase2(h1);
        end
    end
        z=locs(1,i);
if(sout==1)
    return;
else 
    continue;
end
end
toc

