clc
clear
close all


flc = readfis('flcmf3.fis');


x1 = 0;
x2 = 0;
x3 = 0.2;
x4 = 0;

x = [x1 x2 x3 x4];
X = x;
Y = x3;

u = 0;
U = u;

e = 0;

yr = 0;

dt = 0.01;
Tf = 5;

for t = dt:dt:Tf
    
    [T,s] = ode45(@(T,X)Inverted_Pendulum_Model(T,X,u),[t-dt t],x);
    
    x = s(end,:);
    X = [X; x];
    y = x(3);
    
%     e0 = e;
%     e = y-yr;    
%     de = (e-e0)/dt;
    
    u = 200*evalfis([y x(4)],flc);
    
    U = [U; u];
    Y = [Y; y];    
end
    
plot(0:dt:Tf,Y)    
    
cost = sum(Y.^2)    
    
    
    
    