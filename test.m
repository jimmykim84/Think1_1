% 这是一个测试代码，用于将图像高纹理区域定位标记
% 1.输入图像I，首先变成灰度图
% 2.采用3*3高斯平滑算子O,得到图像残差 G=|I-I*O|
% 3.设置阈值r ，将G转换为二值map B
% 4.采用3*3膨胀算子V对B扩张, K=B|+|V
% 5.得到I的高纹理边缘
%
%%%%%%%%%%%%%%%%%%%%%%
clc;clear

% 1  输入图像I，首先变成灰度图
imPath = '/Users/jimmykim/Documents/Project/mytest/basicTest/Think1_1/Sony_DSC-T77_1c.JPG';
im = imread(imPath);
im = im2double(im);
I = rgb2gray(im);

% 2 采用3*3高斯平滑算子O,得到图像残差 G=|I-I*O|
O = fspecial('gaussian',[3 3]); %高斯模板
img_smooth = imfilter(I,O,'same'); % 滤波
G =abs(I - img_smooth);
%imshow(G,[])

%  outG = imguidedfilter(G,G);
%  res = G - outG;

% 3 设置阈值r ，将G转换为二值map B
% B = (G > 0.01); % 阈值由G直方图看出，进行选择(笨办法)
G1 = G;
z = quantile(G1(:),0.9); % 分位数设定阈值
range1 = find(G1 < z);
range2 = find(G1 > z);
B = G;
B(range1)=0;
B(range2)=1;
imshow(B);

% 4 采用3*3膨胀算子V对B扩张, K=B|+|V
V = ones(3);
K = imdilate(B,V); % G被V膨胀
%K = ~K;
figure
imshow(K)

% imout = cat(3,im(:,:,1).*K,im(:,:,2).*K,im(:,:,3).*K);
% figure
% imshow(imout)