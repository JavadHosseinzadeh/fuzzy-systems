function [cost, out] = flc_cost_function(p)

global flc1
flc = flc1;
% for i = 1:3
%     flc.rule(i).consequent = p(i);
% end
flc.rule(2).consequent = p(1);
flc.rule(3).consequent = p(2);
flc.rule(4).consequent = p(3);
flc.rule(5).consequent = p(4);
flc.rule(6).consequent = p(5);
flc.rule(7).consequent = p(6);
flc.rule(8).consequent = p(7);
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
%figure,
Error=0;
for i=1:10
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
        [T,s] = ode45(@(T,X)Inverted_Pendulum_Model1(T,X,u,i),[t-dt t],x);
        x = s(end,:);
        X = [X; x];
        y = x(3);
        u = k3*evalfis([k1*y k2*x(4)],flc);
        U = [U; u];
        Y = [Y; y];
    end
    Error = Error + sum(Y.^2);
%     plot (0:dt:Tf,Y)
%     hold on
end
cost = Error;
out.Y = Y;
out.U = U;
out.X = X;
out.flc = flc;
out.t = 0:dt:Tf;
opt_flc=out.flc;
    
    
    