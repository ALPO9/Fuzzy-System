function out = draw_car(startpoint, endpoint, headsize, linewidth, ra)
% accepts two [x y] coords and one double headsize 
v1 = headsize*(startpoint-endpoint)/2.5; 
theta = 22.5*pi/180; 
theta1 = -1*22.5*pi/180; 
rotMatrix = [cos(theta)  -sin(theta) ; sin(theta)  cos(theta)];
rotMatrix1 = [cos(theta1)  -sin(theta1) ; sin(theta1)  cos(theta1)];  
v2 = v1*rotMatrix; 
v3 = v1*rotMatrix1; 
x1 = endpoint;
x2 = x1 + v2; 
x3 = x1 + v3; 
% arr = endpoint-startpoint
% ra1 = atan(arr(2)/arr(1))
% ra1 = ra*180/pi
hold on; 

% middle point of the backside
plot(endpoint(1), endpoint(2), 'rs');

w=headsize
l=linewidth

% vehicle body points
x0 = startpoint(1) + w/2*sin(ra); %左前角x坐标
y0 = startpoint(2) - w/2*cos(ra); %左前角y坐标
x1 = startpoint(1) - w/2*sin(ra); %右前角x坐标
y1 = startpoint(2) + w/2*cos(ra); %右前角y坐标
p  = startpoint(1) + l*cos(ra);
q  = startpoint(2) + l*sin(ra);
x2 = p + w/2*sin(ra); %左后角x坐标
y2 = q - w/2*cos(ra); %左后角y坐标
x3 = p - w/2*sin(ra); %右后角x坐标
y3 = q + w/2*cos(ra); %右后角y坐标

% vehicle body color
fill([x0 x1 x3 x2],[y0 y1 y3 y2],[1 1 1]);% this fills the vehicle (black) 

% outline of the vehicle
l0 = line([x0 x1], [y0 y1]);
l1 = line([x1 x3], [y1 y3]);
l2 = line([x2 x3], [y2 y3]);
l3 = line([x0 x2], [y0 y2]);
set(l0, 'linewidth', 1, 'color', 'black');
set(l1, 'linewidth', 1, 'color', 'black');
set(l2, 'linewidth', 1, 'color', 'black');
set(l3, 'linewidth', 1, 'color', 'black');

% plot(x0, y0, 'o', 'color',[0.5 1 1]);
% plot(x1, y1, 'o','color',[0.5 1 1]);
% plot(x2, y2, 'rs');
% plot(x3, y3, 'rs');
% arror
% fill([x1(1) x2(1) x3(1)],[x1(2) x2(2) x3(2)],[1 0 0]);% this fills the arrowhead (black) 

% vehicle axles and wheels
l0 = 1.5
startwheelpointx = startpoint(1)+ l0/2*cos(ra)
startwheelpointy = startpoint(2)+ l0/2*sin(ra)
endwheelpointx = endpoint(1)- l0/2*cos(ra)
endwheelpointy = endpoint(2)-l0/2*sin(ra)
plot([startwheelpointx endwheelpointx],[startwheelpointy endwheelpointy],'linewidth',1,'color',[0 0 0]);

l1 = 1.329
w1x0 = startwheelpointx + l1/2*sin(ra); 
w1y0 = startwheelpointy - l1/2*cos(ra); 
w1x1 = startwheelpointx - l1/2*sin(ra); 
w1y1 = startwheelpointy + l1/2*cos(ra); 
plot([w1x0 w1x1],[w1y0 w1y1],'linewidth',1,'color',[0 0 0]);

w2x0 = endwheelpointx + l1/2*sin(ra); 
w2y0 = endwheelpointy - l1/2*cos(ra); 
w2x1 = endwheelpointx - l1/2*sin(ra); 
w2y1 = endwheelpointy + l1/2*cos(ra); 
plot([w2x0 w2x1],[w2y0 w2y1],'linewidth',1,'color',[0 0 0]);


% parking lot
h1 = line([0 18.5], [25 25]);
h2 = line([18.5 18.5], [25 30]);
h3 = line([18.5 21.5], [30 30]);
h4 = line([21.5 21.5], [25 30]);
h5 = line([21.5 40], [25 25]);
set(h1, 'linewidth', 1, 'color', 'black');
set(h2, 'linewidth', 1, 'color', 'black');
set(h3, 'linewidth', 1, 'color', 'black');
set(h4, 'linewidth', 1, 'color', 'black');
set(h5, 'linewidth', 1, 'color', 'black');


% Draw updated car position.
%     carpoly = polyshape([x0 y0 x3 y3], [x2 y2 x1 y1]);
%     plot(carpoly,'EdgeColor','black','FaceColor','white', 'FaceAlpha',1,'EdgeAlpha',1)
% plot([startpoint(1) endpoint(1)],[startpoint(2) endpoint(2)],'linewidth',linewidth,'color',[0 0 0]);

pause(0.25)
end

function car = updateBoundingCorners(car)

% Update coordinates of the corners of the car.

car.xfLeft = car.xf + car.offset*cosd(car.theta) - 0.5*car.height*sind(car.theta);
car.yfLeft = car.yf + car.offset*sind(car.theta) + 0.5*car.height*cosd(car.theta);

car.xfRight = car.xf + car.offset*cosd(car.theta) + 0.5*car.height*sind(car.theta);
car.yfRight = car.yf + car.offset*sind(car.theta) - 0.5*car.height*cosd(car.theta);

car.xrLeft = car.xr - car.offset*cosd(car.theta) - 0.5*car.height*sind(car.theta);
car.yrLeft = car.yr - car.offset*sind(car.theta) + 0.5*car.height*cosd(car.theta);

car.xrRight = car.xr - car.offset*cosd(car.theta) + 0.5*car.height*sind(car.theta);
car.yrRight = car.yr - car.offset*sind(car.theta) - 0.5*car.height*cosd(car.theta);

end