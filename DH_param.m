%Function to calculate the position of the end effector
%Similar to Link_Trans_Matrix function but takes all the variables as
%inputs and returns the overall transformation matrix

function [trans] = DH_param (theta1, theta2, theta3, theta4, theta5, theta6)

%getting the robo parameters
Rparm = RoboParameters();

d1=Rparm(1);
a2 = Rparm(2);
a3 = Rparm(3);
a4 = Rparm(4);
d45 = Rparm(5);
% syms d1 a2 a3 a4 d45


%Function calls to calculate the transformation matrics for joint i wrt i-1
t01 = Trans_Matrix(0, -90, d1, theta1);
t12 = Trans_Matrix(a2, 0, 0, theta2);
t23 = Trans_Matrix(a3, 90, 0, theta3);
t34 = Trans_Matrix(a4, -90,-d45, theta4);
t45 = Trans_Matrix(0, 90, 0, theta5);
t56 = Trans_Matrix(0, -90, 0, theta6);


%Calculation of overall transformation matrix from frame 0 to frame 7

t02 = (t01*t12);
t03 = (t01*t12*t23);
t04 = (t01*t12*t23*t34);
t05 = (t01*t12*t23*t34*t45);
t06 = (t01*t12*t23*t34*t45*t56);


trans = [t01, t02, t03, t04, t05, t06];


