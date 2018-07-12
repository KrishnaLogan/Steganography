clear all;
clc;
close all;

encImage = imread('C:\Users\MK\Desktop\New folder\stegoimg.bmp');
inputImage = imread('C:\Users\MK\Desktop\New folder\origimg.bmp');

[row, col, pl] = size(encImage);

% % for recovering encrypted.txt file
x = 1;
for i = 1:row
    for j = 1:col
        if(encImage(i,j,1) == inputImage(i,j,1))
            break;
        end
        decMsg(x)= bitxor(encImage(i,j,1), inputImage(i,j,1));
        x = x + 1;
    end
    if(encImage(i,j,1) == inputImage(i,j,1))
            break;
    end
end

charMsg = char(decMsg);
 %code to save recovered cipher  text
edit('decrypted.txt');   %new file is created
fileID = fopen('decrypted.txt','w');
fprintf(fileID,'%s',charMsg);
fclose(fileID);

% % % for recovering D.txt file
y = 1;
for i = 1:row
    for j = 1:col
        if(encImage(i,j,2) == inputImage(i,j,2))
            break;
        end
        decMsg1(y)= bitxor(encImage(i,j,2), inputImage(i,j,2));
        y = y + 1;
    end
    if(encImage(i,j,2) == inputImage(i,j,2))
            break;
    end
end

charMsg1 = char(decMsg1);
 %code to save recovered cipher  text
edit('D.txt');   %new file is created
fileID = fopen('D.txt','w');
fprintf(fileID,'%s',charMsg1);
fclose(fileID);

% % % for recovering N.txt file 
z = 1;
for i = 1:row
    for j = 1:col
        if(encImage(i,j,3) == inputImage(i,j,3))
            break;
        end
        decMsg2(z)= bitxor(encImage(i,j,3), inputImage(i,j,3));
        z = z + 1;
    end
    if(encImage(i,j,3) == inputImage(i,j,3))
            break;
    end
end

charMsg2 = char(decMsg2);
 %code to save recovered encrypted  text
edit('N.txt');   %new file is created
fileID = fopen('N.txt','w');
fprintf(fileID,'%s',charMsg2);
fclose(fileID);
