kw = imread('kw.bmp');
load('maskiPP.mat');

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), R1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), R1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), R2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), R2, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), P1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), P1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), P2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), P2, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), S1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), S1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), S2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), S2, 'same')));

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt(abs(OS1) + abs(OS2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

kw = imread('jet.bmp');

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt(abs(OS1) + abs(OS2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, [])
