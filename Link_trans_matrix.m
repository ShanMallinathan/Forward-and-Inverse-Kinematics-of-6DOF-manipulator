%Function to calculate the link transformation matrix
%Not an user input function but to calculate the designed 7 DOF
%manipulator's transformation matrix

function[t06] = Link_trans_matrix
% Declaring the joint angles, joint offsets as a variable
syms d1 d5 a3 a2 a4 theta2 theta3 theta4 theta5 theta6 theta1

%Function calls to calculate the transformation matrics for joint i wrt i-1
t01 = Trans_Matrix(0, -90, d1, theta1)
t12 = Trans_Matrix(a2, 0, 0, theta2)
t23 = Trans_Matrix(a3, 90, 0, theta3)
t34 = Trans_Matrix(a4, -90,-d5, theta4)
t45 = Trans_Matrix(0, 90, 0, theta5)
t56 = Trans_Matrix(0, -90, 0, theta6)

t02 = t01*t12
t03 = t01*t12*t23
t04= t01*t12*t23*t34
t05 = t01*t12*t23*t34*t45
t06 = t01*t12*t23*t34*t45*t56
t36 = t34*t45*t56

X = simplify(t06(1,4))
Y = simplify(t06(2,4))
Z = simplify(t06(3,4))

eq1 = simplify(X^2+Y^2)
