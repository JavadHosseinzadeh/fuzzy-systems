function dx = Inverted_Pendulum_Model(t,x,u,i)

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);


M = linspace(1.25,2.75,10);
m = 1;
g = 9.8;
l = 1;
f = .5;

dx1 = x2;
dx2 = (-m*g*sin(x3)*cos(x3)+m*l*x4^2*sin(x3)+f*m*x4*cos(x3)+u)/(M(i)+(1-(cos(x3))^2)*m);
dx3 = x4;
dx4 = ((M(i)+m)*(g*sin(x3)-f*x4)-(l*m*x4^2*sin(x3)+u)*cos(x3))/(l*(M(i)+(1-(cos(x3))^2)*m));

dx = [dx1; dx2; dx3; dx4];

end

