% ����һ�����Դ��룬���ڽ�ͼ�����������λ���
% 1.����ͼ��I�����ȱ�ɻҶ�ͼ
% 2.����3*3��˹ƽ������O,�õ�ͼ��в� G=|I-I*O|
% 3.������ֵr=0.02 (ԭ��0.9) ����Gת��Ϊ��ֵmap B
% 4.����3*3��������V��B����, K=B|+|V
% 5.�õ�I�ĸ������Ե
%
%%%%%%%%%%%%%%%%%%%%%%
clc;clear
imPath = '/Users/jimmykim/Documents/Project/mytest/basicTest/Think1_1/Sony_DSC-T77_1c.JPG';
im = imread(imPath);
im = im2double(im);
I = rgb2gray(im);

O = fspecial('gaussian',[3 3]); %��˹ģ��
img_smooth = imfilter(I,O,'same'); % �˲�
G =abs(I - img_smooth);
%imshow(G,[])

B = (G > 0.02); % ��ֵ��Gֱ��ͼ����������ѡ��
%  outG = imguidedfilter(G,G);
%  res = G - outG;
%  figure
%  imshow(res,[])
V = ones(3);
K = imdilate(B,V); % G��V����
% figure
% imshow(K)
