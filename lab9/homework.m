%% initialization
close all;
clearvars;
clc;

%% processing
obraz = zeros(11, 11);

%initialization
obraz(1, 1) = 1;
obraz(2, 2) = 1;
obraz(3, 3) = 1;

%standard
[H,theta,rho] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);
%manual
myH = myFunc(obraz, -15, 15, 0.1, -100, 100, 0.5);

figure(1);
subplot(1, 2, 1); imshow(H, []); title('(1, 1), (2, 2), (3, 3)');
subplot(1, 2, 2); imshow(myH, []); title('my function');

I = imread('kwadraty.png');
I_edge = edge(I, 'log');
[H,theta,rho] = hough(I_edge);
P = houghpeaks(H, 8);
myI = myFunc(I, 0, 4, 0.3, -1, 3, 0.3);

figure;
subplot(2, 2, 1); imshow(I); title('original');
subplot(2, 2, 2); imshow(I_edge); title('log');
subplot(2, 2, 3); imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');

axis on, axis normal, hold on;
plot(theta(P(:,2)),rho(P(:,1)),'s','color','white'); title('hough');

subplot(2, 2, 4); imshow(myI, []); title('my function');