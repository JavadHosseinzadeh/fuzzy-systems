clc
clear
close all
warning('off')
tic
global flc1

flc1 = readfis('flcmf3.fis');
% LB = [1 1 1 1 1 0.01 0.01 0.01 0.01 0.01 0.01 0.01];
% UB = [3.99 7.99 7.99 7.99 7.99 0.99 0.99 0.99 0.99 10 10 1000];

LBRule=0.5*ones(1,7);
LBmfs=0.01*ones(1,12);
LBgains=[0.01 0.01 0.01];
UBRule=3.99*ones(1,7);
UBmfs=0.99*ones(1,12);
UBgains=[10 10 1000];
LB=[LBRule LBmfs LBgains];
UB=[UBRule UBmfs UBgains];

%    {--rules--*-------mfs-------*-gains-} 
x0 = [1 3 1 2 3 1 3 rand(1,12) 1 1 200];

options = gaoptimset('InitialPopulation',x0,'Generations',40,'PopulationSize',40,'Display','iter');

x = ga(@flc_cost_function,22,[],[],[],[],LB,UB,[],1:7,options);

[cost, out] = flc_cost_function(x);
plot(out.t,out.Y,'linewidth',2)

xlabel('Time (s)')
ylabel('\theta (rad)')
grid
toc
save('Final_result','x','out','flc1')