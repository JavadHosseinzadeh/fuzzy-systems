function [cost, out] = flc_cost_function(p)
a = floor(p(1:3));
global flc1
flc = flc1;
for i = 1:3
    flc.rule(i).consequent = a(i);
end
% update input mfs
flc.input(1).mf(1).params(1) = -1;
flc.input(1).mf(1).params(2) = -p(4);
flc.input(1).mf(1).params(3) = 0;
flc.input(1).mf(2).params(1) = -p(5);
flc.input(1).mf(2).params(2) = 0;
flc.input(1).mf(2).params(3) = p(6);
flc.input(1).mf(3).params(1) = 0;
flc.input(1).mf(3).params(2) = p(7);
flc.input(1).mf(3).params(3) = 1;

flc.input(2).mf(1).params(1) = -1;
flc.input(2).mf(1).params(2) = -p(8);
flc.input(2).mf(1).params(3) = 0;
flc.input(2).mf(2).params(1) = -p(9);
flc.input(2).mf(2).params(2) = 0;
flc.input(2).mf(2).params(3) = p(10);
flc.input(2).mf(3).params(1) = 0;
flc.input(2).mf(3).params(2) = p(11);
flc.input(2).mf(3).params(3) = 1;

% update output mfs
% if p(9)<p(8) %swap
%     z = p(8);
%     p(8) = p(9);
%     p(9) = z;
% end

flc.output.mf(1).params(1) = -1;
flc.output.mf(1).params(2) = -p(12);
flc.output.mf(1).params(3) = 0;
flc.output.mf(2).params(1) = -p(13);
flc.output.mf(2).params(2) = 0;
flc.output.mf(2).params(3) = p(14);
flc.output.mf(3).params(1) = 0;
flc.output.mf(3).params(2) = p(15);
flc.output.mf(3).params(3) = 1;

% update gains
k1 = p(16);
k2 = p(17);
k3 = p(18);

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
Tf = 15;

for t = dt:dt:Tf
    
    [T,s] = ode45(@(T,X)Inverted_Pendulum_Model(T,X,u),[t-dt t],x);
    
    x = s(end,:);
    X = [X; x];
    y = x(3);
    
%     e0 = e;
%     e = y-yr;    
%     de = (e-e0)/dt;
    
    u = k3*evalfis([k1*y k2*x(4)],flc);
    
    U = [U; u];
    Y = [Y; y];    
end
    
cost = [sum(Y.^2) max(0,max(-Y))] ;    
out.Y = Y;
out.U = U;
out.X = X;
out.flc = flc;
out.t = 0:dt:Tf;
out.cost = cost;
opt_flc=out.flc;
    
    
    