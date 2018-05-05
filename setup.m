
WANDER_MODE = 'default'; %(other otpion >>WANDER_MODE = 'simple')
COURSE_NAME = 'course';  %(other option >>COURSE_NAME = 'office')

posn = [0,0,0];         %ydim, xdim, angle
rad = 4;                %robot's body radius (pixels)
wdia = 8;               %distance between robot's wheels (pixels)
dt = .09;                %timestep between driving and colecting sensor data

if(strcmp(COURSE_NAME,'course'))
  course = rgb2gray(imread('course.png'));  %image of 'course'
else
  course = rgb2gray(imread('office.png'));  %image of 'office'
end

imagesc(course), axis image off; colormap gray;

title('Click to specify robots starting position');
%collect input point for robot starting posn.
[posn(1) posn(2)] = ginput(1);
drawbot(posn,rad, course);

title('Click to specify robots inital heading');
%collect input point for robot heading
[y x] = ginput(1);
y = y - posn(1);
x = x - posn(2);
[posn(3), r] = cart2pol(x,y);

%show the start position for half a second
drawbot(posn,rad, course);

pause(.01);

%begin to wander
if(strcmp(WANDER_MODE,'default'))
  wander(posn, rad, wdia, course, dt);
else
  wander_simple(posn, rad, wdia, course, dt);
end

