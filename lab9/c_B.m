%% initialization
close all;
clearvars;
clc;
 
%% task 1
I_kwa = imread('kwadraty.png');
I_edge = edge(I_kwa,'log');

[H,theta,rho] = hough(I_edge);
P = houghpeaks(H, 8);

figure; 
x = 1; y = 2;
subplot(x, y, 1); imshow(I_kwa); title('original');
subplot(x, y, 2); imshow(I_edge); title('edge log');

figure;
imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(P(:,2)),rho(P(:,1)),'s','color','white');

%houghlines
lines = houghlines(I_edge, theta, rho, P);
figure; 
imshow(I_edge); hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end