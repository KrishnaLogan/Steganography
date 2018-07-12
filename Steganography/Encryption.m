clc;
close all;
clear all;

msg = fileread('C:\Users\MK\Desktop\New folder\encrypted.txt');
oriImage = imread('C:\Users\MK\Desktop\New folder\origimg.bmp');
[row, col, pl] = size(oriImage);
%for Sending encrypted.txt file 

len = length(msg);
msgTemp = uint8(msg);
k = 1;
stegoImage = oriImage;
% imshow(oriImage);
for i = 1:row
    for j = 1:col
        
        stegoImage(i, j, 1) = bitxor(msgTemp(k), oriImage(i, j, 1));
        k = k + 1;
        if(k > len)
            break;
        end 
    end
    if(k > len)
            break;
    end
end

% %for Sending D.txt file 
msg1 = fileread('D.txt');
len1 = length(msg1);
msgTemp1 = uint8(msg1);
k = 1;

% imshow(oriImage);
for i = 1:row
    for j = 1:col
        
        stegoImage(i, j, 2) = bitxor(msgTemp1(k), oriImage(i, j, 2));
        k = k + 1;
        
        if(k > len1)
            break;
        end 
    end
    if(k > len1)
            break;
    end
end 
% %for Sending N.txt file 
msg2 = fileread('N.txt');
len2 = length(msg2);
msgTemp2 = uint8(msg2);
k = 1;

% imshow(oriImage);
for i = 1:row
    for j = 1:col
        stegoImage(i, j, 3) = bitxor(msgTemp2(k), oriImage(i, j, 3));
        k = k + 1;
        
        if(k > len2)
            break;
        end 
    end
    
    if(k > len2)
            break;
    end 
end
%Results
imwrite(stegoImage, 'stegoimg.bmp');