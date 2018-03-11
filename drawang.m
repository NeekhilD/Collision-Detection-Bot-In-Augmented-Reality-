

function drawang(posn, mag)

% do some polar to cartesian math
y = [posn(1), posn(1)+ mag*sin(posn(3))];
x = [posn(2), posn(2)+ mag*cos(posn(3))];

%plot the line
plot(y,x,'r');
