function y=phase3(h2)
 
% Read the pre-built characters to a cell array
db={imread('A.bmp'),imread('B.bmp'),imread('C.bmp'),imread('D.bmp'),
	imread('E.bmp'),imread('F.bmp'),imread('G.bmp'),imread('H.bmp'),
	imread('I.bmp'),imread('J.bmp'),imread('K.bmp'),imread('L.bmp'),
	imread('M.bmp'),imread('N.bmp'),imread('O.bmp'),imread('P.bmp'),
	imread('Q.bmp'),imread('R.bmp'),imread('S.bmp'),imread('T.bmp'),
	imread('U.bmp'),imread('V.bmp'),imread('W.bmp'),imread('X.bmp'),
	imread('Y.bmp'),imread('Z.bmp'),imread('0.bmp'),imread('1.bmp'),
	imread('2.bmp'),imread('3.bmp'),imread('4.bmp'),imread('5.bmp'),
	imread('6.bmp'),imread('7.bmp'),imread('8.bmp'),imread('9.bmp'),
	imread('A1.bmp'),imread('C1.bmp'),imread('c2.bmp'),imread('D1.bmp'),
	imread('G1.bmp'),imread('K1.bmp'),imread('M1.bmp'),imread('Z1.bmp'),
	imread('01.bmp'),imread('11.bmp'),imread('21.bmp'),imread('41.bmp'),
	imread('51.bmp'),imread('61.bmp'),imread('62.bmp'),imread('63.bmp'),
	imread('81.bmp')};

[h2m h2n]=size(h2);
noe=53;
ratio(1,noe)=0;
for i=1:noe
    
    % Resize the pre-built images to same size as obtained characters
    h3=imresize(db{i},[h2m h2n]);
    
    % Subtract actual character with pre-built characters
    h4=imabsdiff(h2,h3);

    % calculate the number of ones in the difference image
    countones=sum(sum(h4));
    total=h2m*h2n;
    
    % Calculate normalized count of ones
    ratio(1,i)=countones/total;
end
y=0;
[x,z]=min(ratio);
 
% Character recognition 
if(x<0.3)
   switch z
    case {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26}
        y='A'+(z-1);
    case {27,28,29,30,31,32,33,34,35,36}
        y='0'+(z-27);
    case 37
        y='A';
    case {38,39}
        y='C';
    case 40
        y='D';
    case 41
        y='G';
    case 42
        y='K';
    case 43
        y='M';
    case 44
        y='Z';
    case 45
        y='0';
    case 46
        y='1';
    case 47
        y='2';
    case 48
        y='4';
    case 49
        y='5';
    case {50,51,52}
        y='6';
    case 53
        y='8';
    otherwise
        disp('number missing');
    end
end

