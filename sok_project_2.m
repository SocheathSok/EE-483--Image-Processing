%% Project 2: Image Effects Mascot Concept
% Name: Socheath Sok
% ID: 014470701
% Class: EE 483, T/Th 2:00 - 3:15 pm

%% Grayscale
i = imread('tiger.png'); 
g = rgb2gray(i);
imshow(g); title('original');

%% Rotation
rot = imrotate(g,90,'bicubic');
imshow(rot)
%% Crop Image
%[J, rect] = imcrop(rot);
imshow(J)
%% Mirror Image
flipim = (fliplr(J));
newImg = imfuse(J,flipim,'montage');
imshow(newImg)
%% Oil Painting filter
op = colfilt(newImg,[7,7],'sliding',@mode);
imshow(op)

%% Pseudocoloring
g = 53/360;
cm = [ 0 0 0;0 0 0;g 0 0;0 0 0;0 0 0;
        g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;
        g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;g 1 0.4 ;
        g 1 0.4 ;g 1 0.45 ; g 1 0.5 ;g 1 0.55 ;g 1 0.6 ;
        g 1 0.65 ;g 1 0.7 ;g 1 0.75 ;g 1 0.8 ;g 1 0.85 ;
        g 1 0.9 ;g 1 0.95 ;g 0.7 0.95 ;g 0.95 1 ; g 0.5 1 ;
        0.13 0.3 .95 ;  g 0.4 1  ];
[n s] = size(cm);
t = n;
cmap = hsv2rgb(cm);
[c,m] = gray2ind(op,t);
imshow(c,cmap); title('Final Image');
imwrite(c,cmap,'goldtiger.png');

%%
%imtool(i);
