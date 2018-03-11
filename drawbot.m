

function drawbot(posn, rad, course)

hold off;
%show the course
imagesc(course), axis image off; colormap gray;

hold on;

%draw a little circle for the robot
angs = 0:pi/10:2*pi;
y = posn(1) + rad*sin(angs);
x = posn(2) + rad*cos(angs);
plot(y,x);

%draw 10cm 'DANGER ZONE'
% y = posn(1) + (rad+10)*sin(angs);
% x = posn(2) + (rad+10)*cos(angs);
% plot(y,x,'r:');

%draw little wiskers representing 10cm rangefinders
drawang([posn(1), posn(2), posn(3) + pi/8],10+rad);
drawang([posn(1), posn(2), posn(3) - pi/8],10+rad);

