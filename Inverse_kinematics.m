%program to find inverse kinematics
function Inverse_kinematics

%getting the robo parameters
Rparm = RoboParameters();

d1=Rparm(1);
a2 = Rparm(2);
a3 = Rparm(3);
a4 = Rparm(4);
d5 = Rparm(5);

%To get the target value and orientation:
disp("Enter the following values:");
prompt = "Px = ";
px = input(prompt);
prompt = "Py = ";
py = input(prompt);
prompt = "Pz = ";
pz = input(prompt);
prompt = "alpha (Z euler rotation wrt base) = ";
zang = input(prompt);
prompt = "beta (Y euler rotation wrt base) = ";
yang = input(prompt);
prompt = "gamma (X euler rotation wrt base) = ";
xang = input(prompt);

%Theta3
h = sqrt(a4^2+d5^2);
alpha = atan2d(d5,a4);
sb = ((py-d1)/h);
cb = sqrt(1 - sb^2);
beta = atan2d(sb, cb);
theta3 = alpha + beta

%Theta2
f = sqrt(px^2+pz^2);
rprime = h*cosd(beta);
theta2 = acosd((f^2-a2^2-(a3+rprime)^2)/(2*a2*(a3+rprime)))

%Theta1
pii = atan2d(pz,px)    ;                                                                                                                                                                                                                                                               ;
si = acosd((f^2 + a2^2 - (a3+rprime)^2)/(2*a2*f));
theta1 = -(si+pii) %As sense of pz and theta1 are inverted

%Orientation
theta456 = IK_orientation(zang, yang, xang, theta1, theta2, theta3);

theta4 = theta456(1)
theta5 = theta456(3)
theta6 = theta456(5)
theta44 = theta456(2)
theta44 = theta456(4)
theta44 = theta456(6)

