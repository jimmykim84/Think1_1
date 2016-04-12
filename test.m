% 这是一个测试代码，用于将图像高纹理区域定位标记
% 1.输入图像I，首先变成灰度图
% 2.采用3*3高斯平滑算子O,得到图像残差 G=|I-I*O|
% 3.设置阈值r=0.02 (原文0.9) ，将G转换为二值map B
% 4.采用3*3膨胀算子V对B扩张, K=B|+|V
% 5.得到I的高纹理边缘
%
%%%%%%%%%%%%%%%%%%%%%%
clc;clear
imPath = '/Users/jimmykim/Documents/Project/mytest/basicTest/Think1_1/Sony_DSC-T77_1c.JPG';
im = imread(imPath);
im = im2double(im);
I = rgb2gray(im);

O = fspecial('gaussian',[3 3]); %高斯模板
img_smooth = imfilter(I,O,'same'); % 滤波
G =abs(I - img_smooth);
%imshow(G,[])

B = (G > 0.02); % 阈值由G直方图看出，进行选择
%  outG = imguidedfilter(G,G);
%  res = G - outG;
%  figure
%  imshow(res,[])
V = ones(3);
K = imdilate(B,V); % G被V膨胀
% figure
% imshow(K)
