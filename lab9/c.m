%% initialization
close all;
clearvars;
clc;
 
%% task 1
% obraz = zeros(11, 11);
% obraz(1, 2) = 1;
% 
% [H,theta,rho] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);
% 
% figure;
% imshow(H, []); title('(1,2) = 1');
% 
% obraz(1, 1) = 1;
% obraz(3, 3) = 1;
% obraz(5 , 5) = 1;
% [H,theta,rho] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);
% figure;
% imshow(H, []); title('(1,2) = 1, (1, 1), (3, 3), (5, 5)');
% 
% p = rho(200);
% q = theta(270);
% x = 1:0.1:10;
% y = ((p-x*cosd(q))/sind(q));
% 
% figure;
% imshow(obraz);
% figure;
% plot(x+1, y + 1);

obraz = zeros(11);

obraz(5,7) = 1;
obraz(3,4) = 1;
obraz(5,5) = 1;

[H, theta, rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

p = rho(161);
o = theta(128);

x = 0:0.1:10;

y = ((p - x*cosd(o))/sind(o));

figure(2);
imshow(obraz, 'InitialMagnification', 5000);
hold on;
plot(x+1, y+1);
hold off;

figure(1);
imshow(H, []);
