clc
clear
close all

load Final_result

i1 = 0;
for i = -1:.05:1
    i1 = i1+1;
    i2 = 0;
    for j = -1:.05:1
        i2 = i2+1;
        a1(i1,i2) = evalfis([i,j],flc1); %Initial
        a2(i1,i2) = evalfis([i,j],out.flc); %Optimized
    end
end

figure
surf(-1:.05:1,-1:.05:1,a1)
xlabel('e')
ylabel('de')
zlabel('u')
title('Initial Fuzzy Controller')

figure
surf(-1:.05:1,-1:.05:1,a2)
xlabel('e')
ylabel('de')
zlabel('u')
title('Optimized Fuzzy Controller')
 
figure,
[cost, out] = flc_cost_function(x);
plot(out.t,out.Y,'linewidth',2.5)

xlabel('Time (s)')
ylabel('\theta (rad)')
grid