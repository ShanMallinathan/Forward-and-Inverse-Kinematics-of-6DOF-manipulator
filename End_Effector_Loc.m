%Function to know the location of end effector 


prompt = "Specify d6 (distance betweed X5 and X6): ";
d6 = input(prompt);

mount_offset = [0;0;d6;0;]; %offset between frame 7 and 6 (not included in DH parameter)
TCP = mount_offset + [0;0;0;1;]; %deault value of TCP 



%To get user input of variables d1 and theta i

disp("Enter the following robot variable values")
prompt = ('theta1 =');
theta1 = input(prompt);
prompt = ('theta2 =');
theta2 = input(prompt);
prompt = ('theta3 =');
theta3 = input(prompt);
prompt = ('theta4 =');
theta4 = input(prompt);
prompt = ('theta5 =');
theta5 = input(prompt);
prompt = ('theta6 =');
theta6 = input(prompt);

trans = DH_param(theta1, theta2, theta3, theta4, theta5, theta6);
T06 = trans(1:4, 21:24)

%To Difine TCP
prompt = ("Do you have an end effector attacher? (1-Yes/0-No): ");
answer2 = input(prompt);

if answer2 == 1
    prompt = 'Press 1 to enter the coordinates with respect to base and 2 with respect to frame 6: ';
    answer3 = input(prompt);
    prompt = "TCP_X = ";
    TCP_X = input(prompt);
    prompt = "TCP_Y = ";
    TCP_Y = input(prompt);
    prompt = "TCP_Z = ";
    TCP_Z = input(prompt);
    
    %TCP WRT GLobal coordinate system
    if answer3 ==1
        TCP = [TCP_Y; TCP_Z; TCP_X; 0;];
        
    %TCP WRT frame 6
    elseif answer3 == 2
        TCP_Loc = [TCP_X; TCP_Y; TCP_Z; 0;];
        TCP = TCP+TCP_Loc;
    end
end

Frame6_0 = T06 * [0;0;0;1] 
TCP_Global = T06 * TCP

zyx = rotm2eul(T06(1:3, 1:3))*180/pi




