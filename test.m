% ����һ�����Դ��룬���ڽ�ͼ�����������λ���
% 1.����ͼ��I�����ȱ�ɻҶ�ͼ
% 2.����3*3��˹ƽ������O,�õ�ͼ��в� G=|I-I*O|
% 3.������ֵr ����Gת��Ϊ��ֵmap B
% 4.����3*3��������V��B����, K=B|+|V
% 5.�õ�I�ĸ������Ե
%
%%%%%%%%%%%%%%%%%%%%%%
clc;clear

% 1  ����ͼ��I�����ȱ�ɻҶ�ͼ
imPath = '/Users/jimmykim/Documents/Project/mytest/basicTest/Think1_1/Sony_DSC-T77_1c.JPG';
im = imread(imPath);
im = im2double(im);
I = rgb2gray(im);

% 2 ����3*3��˹ƽ������O,�õ�ͼ��в� G=|I-I*O|
O = fspecial('gaussian',[3 3]); %��˹ģ��
img_smooth = imfilter(I,O,'same'); % �˲�
G =abs(I - img_smooth);
%imshow(G,[])

%  outG = imguidedfilter(G,G);
%  res = G - outG;

% 3 ������ֵr ����Gת��Ϊ��ֵmap B
% B = (G > 0.01); % ��ֵ��Gֱ��ͼ����������ѡ��(���취)
G1 = G;
z = quantile(G1(:),0.9); % ��λ���趨��ֵ
range1 = find(G1 < z);
range2 = find(G1 > z);
B = G;
B(range1)=0;
B(range2)=1;
imshow(B);

% 4 ����3*3��������V��B����, K=B|+|V
V = ones(3);
K = imdilate(B,V); % G��V����
%K = ~K;
figure
imshow(K)

% imout = cat(3,im(:,:,1).*K,im(:,:,2).*K,im(:,:,3).*K);
% figure
% imshow(imout)