function [cost, out] = flc_cost_function(p)

global flc1
flc = flc1;
% for i = 1:3
%     flc.rule(i).consequent = p(i);
% end
a=floor(p(1:7));
flc.rule(2).consequent = a(1);
flc.rule(3).consequent = a(2);
flc.rule(4).consequent = a(3);
flc.rule(5).consequent = a(4);
flc.rule(6).consequent = a(5);
flc.rule(7).consequent = a(6);
flc.rule(8).consequent = a(7);
% update input mfs
flc.input(1).mf(1).params(1) = -1;
flc.input(1).mf(1).params(2) = -p(8);
flc.input(1).mf(1).params(3) = 0;
flc.input(1).mf(2).params(1) = -p(9);
flc.input(1).mf(2).params(2) = 0;
flc.input(1).mf(2).params(3) = p(10);
flc.input(1).mf(3).params(1) = 0;
flc.input(1).mf(3).params(2) = p(11);
flc.input(1).mf(3).params(3) = 1;

flc.input(2).mf(1).params(1) = -1;
flc.input(2).mf(1).params(2) = -p(12);
flc.input(2).mf(1).params(3) = 0;
flc.input(2).mf(2).params(1) = -p(13);
flc.input(2).mf(2).params(2) = 0;
flc.input(2).mf(2).params(3) = p(14);
flc.input(2).mf(3).params(1) = 0;
flc.input(2).mf(3).params(2) = p(15);
flc.input(2).mf(3).params(3) = 1;

% update output mfs
% if p(9)<p(8) %swap
%     z = p(8);
%     p(8) = p(9);
%     p(9) = z;
% end

flc.output.mf(1).params(1) = -1;
flc.output.mf(1).params(2) = -p(16);
flc.output.mf(1).params(3) = 0;
flc.output.mf(2).params(1) = -p(17);
flc.output.mf(2).params(2) = 0;
flc.output.mf(2).params(3) = p(18);
flc.output.mf(3).params(1) = 0;
flc.output.mf(3).params(2) = p(19);
flc.output.mf(3).params(3) = 1;

% update gains
k1 = p(20);
k2 = p(21);
k3 = p(22);

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

dt = 0.05;
Tf = 10;

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
    
cost = [sum(Y.^2) max(0,max(-Y))];    
out.Y = Y;
out.U = U;
out.X = X;
out.flc = flc;
out.t = 0:dt:Tf;
out.cost = cost;
opt_flc = out.flc;
    

    