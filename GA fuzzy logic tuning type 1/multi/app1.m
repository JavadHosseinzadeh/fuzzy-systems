clc
clear
close all
warning('off')

global flc1

flc1 = readfis('flcmf3.fis');
% LB = [1 1 1 1 1 0.01 0.01 0.01 0.01 0.01 0.01 0.01];
% UB = [3.99 7.99 7.99 7.99 7.99 0.99 0.99 0.99 0.99 10 10 1000];

LBRule=1.5*ones(1,7);
LBmfs=0.01*ones(1,12);
LBgains=[0.01 0.01 0.01];
UBRule=3.99*ones(1,7);
UBmfs=0.99*ones(1,12);
UBgains=[10 10 1000];
LB=[LBRule LBmfs LBgains];
UB=[UBRule UBmfs UBgains];

%    {--rules--*-------mfs-------*-gains-} 
x0 = [1 3 1 2 3 1 3 rand(1,12) 1 1 200];

options = gaoptimset('InitialPopulation',x0,'Generations',30,'PopulationSize',40,'Display','iter');

x = gamultiobj(@flc_cost_function1,22,[],[],[],[],LB,UB,[],options);
%%
figure,
for i=1:size(x,1)
[cost(i,:), out(i,:)] = flc_cost_function1(x(i,:));
plot(out(i).t,out(i).Y,'linewidth',1.5)
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

save('Final_result1','x','out','flc1')
%%
z=x;
z(:,1:7)=floor(z(:,1:7));
