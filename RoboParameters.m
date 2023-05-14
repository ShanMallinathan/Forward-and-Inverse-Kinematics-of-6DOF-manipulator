function [Rparm] = RoboParameters
%Predifined values for the link offsets and link lengths
d1=3000;
a2 = 500;
a3 = 400;
a4 = 400;
d5 = 1000;

%To change link offset and lengths
prompt = "Would you like to specify values for d2, a3, a4 and d5? (1-Yes/0-No): ";
answer = input(prompt);

if answer == 1
    disp("Enter the following values\n") 
    prompt = 'd1 = ';
    d1 = input(prompt);
    prompt = 'a2 = ';
    a2 = input(prompt);
    prompt = 'a3 = ';
    a3 = input(prompt);
    prompt = 'a4 = ';
    a4 = input(prompt);
    prompt = 'd5 = ';
    d5 = input(prompt);
    
end

Rparm = [d1 a2 a3 a4 d5];