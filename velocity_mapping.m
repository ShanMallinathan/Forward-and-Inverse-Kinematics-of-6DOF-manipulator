function velocity_mapping
 %Function to compute the joint/global velocities using jacobian 

syms theta1 theta2 theta3 theta4 theta5 theta6


jac = jacobian();
disp("______________________________________________________________");
prompt = "Enter 1 to compute the joint velocities and 2 to compute overall velocity: ";
answer = input(prompt);
disp("______________________________________________________________");

if answer == 1
    syms Xdot Ydot Zdot wXdot wYdot wZdot
    VelVect = [Xdot; Ydot; Zdot; wXdot; wYdot; wZdot];
    JointVel = (jac) \ VelVect
    jointVel = simplify(JointVel)

elseif answer == 2
    syms theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot 
    JointVel = [theta1dot; theta2dot; theta3dot; theta4dot; theta5dot; theta6dot];
    VelVect = simplify(jac * JointVel)

else
    error("Wrong Choice!! Exiting...")
end