clc
clear
close all

load Final_result1

% i1 = 0;
% for i = -1:.05:1
%     i1 = i1+1;
%     i2 = 0;
%     for j = -1:.05:1
%         i2 = i2+1;
%         a1(i1,i2) = evalfis([i,j],flc1); %Initial
%         a2(i1,i2) = evalfis([i,j],out.flc); %Optimized
%     end
% end
% 
% figure
% surf(-1:.05:1,-1:.05:1,a1)
% xlabel('e')
% ylabel('de')
% zlabel('u')
% title('Initial Fuzzy Controller')
% 
% figure
% surf(-1:.05:1,-1:.05:1,a2)
% xlabel('e')
% ylabel('de')
% zlabel('u')
% title('Optimized Fuzzy Controller')

figure,
for i=1:size(x,1)
[cost(i,:), out(i,:)] = flc_cost_function1(x(i,:));
plot(out(i).t,out(i).Y,'linewidth',2)
hold on 
end
xlabel('Time (s)')
ylabel('\theta (rad)')
legend('optimal solution 1','optimal solution 2','optimal solution 3',...
    'optimal solution 4','optimal solution 5','optimal solution 6',...
    'optimal solution 7','optimal solution 8','optimal solution 9',...
    'optimal solution 10','optimal solution 11','optimal solution 12',...
    'optimal solution 13','optimal solution 14')
grid
        