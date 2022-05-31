
%% Project 4: Image Segmentation
% Name: Socheath Sok
% ID: 014470701
% Class: EE 483, T/Th 2:00 - 3:15 pm

%% Ch 9: Problem 5,6 & 7
clear;clc;close all;

n = im2uint8(imread('nicework.png'));
c = imread('cameraman.png');
m = imlincomb(0.5,c,0.5,n);
% imtool(m)
t = m>130 & m<250;
subplot(1,2,1); imshow(m); title('Combined Image');
subplot(1,2,2);imshow(t); title('Double Thresholding');
%%
m = im2double(c).*(im2double(n)==0);
% imtool(m)
t = m<0.01;
subplot(1,2,1); imshow(m); title('Combined Image');
subplot(1,2,2);imshow(t); title('Single Thresholding');
%%
t = imread('circles.png');
[x,y] = meshgrid(1:256,1:256);
t2 = double(t).*(x+y)/512;
t3 = im2uint8(t2);
%imtool(t3)
[r,c] = size(t3);
thresh = @(z) im2bw(z.data,graythresh(z.data));
out = blockproc(t3,[r,c/32],thresh);
out1 = blockproc(t3,[r,c/8],thresh);
sgtitle('Adaptive Thresholding');
subplot(1,3,1); imshow(t3); title('Circle Image');
subplot(1,3,2); imshow(out1); title('Block: 256x32');
subplot(1,3,3);imshow(out); title('Block: 256x8');

%% Ch 9: Problem 10
clear;clc;close all;
c = imread('cameraman.png');
lap = fspecial('laplacian',1);
log = fspecial('log',13,2);

r = edge(c,'roberts');
p = edge(c,'prewitt');
s = edge(c,'sobel');
l = imbinarize(imfilter((c),lap)); 
z = edge(c,'zerocross',[],lap);
m = edge(c,'zerocross',[],log);
ca = edge(c,'Canny');
subplot(2,4,1); imshow(c); title('Orginal');
subplot(2,4,2); imshow(r); title('Robert');
subplot(2,4,3); imshow(p); title('Prewitt');
subplot(2,4,4); imshow(s); title('Sobel');
subplot(2,4,5); imshow(l); title('Laplacian');
subplot(2,4,6); imshow(z); title('Zero-crossing of lap');
subplot(2,4,7); imshow(m); title('Marr-Hildreth');
subplot(2,4,8); imshow(ca); title('Canny');

%% Ch 9: Problem 13
clear;clc;close all;
c = imread('arch.png');
c1 = imnoise(c,'salt & pepper');
c2 = imnoise(c,'gaussian');
log = fspecial('log',13,2);

r1 = edge(c1,'roberts');
p1 = edge(c1,'prewitt');
s1 = edge(c1,'sobel');
m1 = edge(c1,'zerocross',[],log);
ca1 = edge(c1,'Canny');

r2 = edge(c2,'roberts');
p2 = edge(c2,'prewitt');
s2 = edge(c2,'sobel');
m2 = edge(c2,'zerocross',[],log);
ca2 = edge(c2,'Canny');

figure(1);
subplot(2,3,1); imshow(c1); title('Salt & Pepper');
subplot(2,3,2); imshow(r1); title('Robert');
subplot(2,3,3); imshow(p1); title('Prewitt');
subplot(2,3,4); imshow(s1); title('Sobel');
subplot(2,3,5); imshow(m1); title('Marr-Hildreth');
subplot(2,3,6); imshow(ca1); title('Canny');

figure(2);
subplot(2,3,1); imshow(c2); title('Gaussian');
subplot(2,3,2); imshow(r2); title('Robert');
subplot(2,3,3); imshow(p2); title('Prewitt');
subplot(2,3,4); imshow(s2); title('Sobel');
subplot(2,3,5); imshow(m2); title('Marr-Hildreth');
subplot(2,3,6); imshow(ca2); title('Canny');

%% Ch 13: Problem 9
clear;clc;close all;

v = imread('venice.png');
lap = fspecial('laplacian',0);
log = fspecial('log',13,2);
ic = rgb2gray(v);

r = edge(ic,'roberts');
p = edge(ic,'prewitt');
s = edge(ic,'sobel'); 
z = edge(ic,'zerocross',[],lap);
m = edge(ic,'zerocross',[],log);
ca = edge(ic,'Canny',[0.1 0.2],0.5);

figure(1)
subplot(2,3,1); imshow(r); title('Robert');
subplot(2,3,2); imshow(p); title('Prewitt');
subplot(2,3,3); imshow(s); title('Sobel');
subplot(2,3,4); imshow(z); title('Zero-cross of lap');
subplot(2,3,5); imshow(m); title('Marr-Hildreth');
subplot(2,3,6); imshow(ca); title('Canny');
%%
a = imread('arch.png');
f = fspecial('laplacian');
subplot(2,4,1); imshow(a);title('original');
subplot(2,4,2); imshow(edge(a,'zerocross',0.4,f)); title('lap: 0.4');
subplot(2,4,3); imshow(edge(a,'sobel',[],'horizontal')); title('Horizontal');
subplot(2,4,4); imshow(edge(a,'log')); title('log');
subplot(2,4,5); imshow(edge(a));title('sobel');
subplot(2,4,6); imshow(edge(a,'canny'));title('canny');
subplot(2,4,7); imshow(edge(a,'zerocross',0.25,f)); title('lap: 0.25');
subplot(2,4,8); imshow(edge(a,'sobel',[],'vertical')); title('vertical');

%%
p = [0.5 0.5 0.1 0.05 0.02 0.01 0.01 0.01];
for i = 1:8
    k(i) = (p(i)*log2(p(i)));
end
z = sum(k)*-1
%%
pt = [0.19 0.25 0.21 0.16 0.08 0.06 0.03 0.02];
pa = [0.07 0.11 0.08 0.04 0.50 0.05 0.06 0.09];
pb = [0.13 0.12 0.13 0.13 0.12 0.12 0.12 0.13];
pc = [0.09 0.13 0.15 0.10 0.14 0.12 0.11 0.16]
ht = huffman(pt)
mt = [2 2 2 3 4 5 6 6]; rt = sum(pt.*mt)
ha = huffman(pa); ma = [4 3 4 5 1 5 4 3]; ra = sum(pa.*ma)
hb = huffman(pb); mb = [3 3 3 3 3 3 3 3]; rb = sum(pb.*mb)
hc = huffman(pc); mc = [3 3 3 3 3 3 3 3]; rc = sum(pc.*mc)

%%
m = [1 0 0 1 1 1;
    0 1 0 1 1 1;
    0 0 1 1 0 1;
    0 1 1 1 0 1;
    1 0 1 0 1 1;
    0 1 1 1 1 0];
r1 = rle(m(1,:))
r2 = rle(m(2,:))
r3 = rle(m(3,:))
r4 = rle(m(4,:))
r5 = rle(m(5,:))
r6 = rle(m(6,:))
%%
close all; 
R = [100 80 100 0; 90 40 160 170; 180 180 255 70; 255 0 255 0]
G = [150 255 100 0; 0 140 160 170;170 180 255 70; 110 100 90 0]
B = [151 80 100 0; 0 140 160 170; 178 178 255 74; 112 107 90 181]
r1 = R<51 | R>199;
g1 = G<51 | G>199;
b1 = B<51 | B>199;
y = r1|g1|b1
%%
 p = [0.4 0.3 0.1 0.08 0.06 0.03 0.02 0.01]
 h = huffman(p)
 m = [1 2 4 4 4 5 6 6]
 r = sum(p.*m)
 
 