%function to calculate the jacobian matrix
%function to calculate the jacobian matrix
function [J] = jacobian
%Robot Parameters
%Predifined values for the link offsets and link lengths

syms theta1 theta2 theta3 theta4 theta5 theta6

%Adding the variables into a matrix
varpar = [ theta1; theta2; theta3; theta4; theta5; theta6;];

% Calling and assigning values to get t07 trans matrix
trans = DH_param(theta1, theta2, theta3, theta4, theta5, theta6);
tz01 = trans(1:3, 3);
tz02 = trans(1:3, 7);
tz03 = trans(1:3, 11);
tz04 = trans(1:3, 15);
tz05 = trans(1:3, 19);
tz06 = trans(1:3, 23);

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%Linear Parameters of jacobian
X = trans(1,24);
Y = trans(2,24);
Z = trans(3,24);

%Matrix holding X Y and Z
lincomp = [X; Y; Z;];

j_lin = jacobian(lincomp, varpar);


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%Rotational Component

j_ang = [tz01 tz02 tz03 tz04 tz05 tz06];

%J overall

J = simplify([j_lin; j_ang;]);
