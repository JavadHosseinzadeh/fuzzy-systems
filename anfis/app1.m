clc;
clear;
close all;

%% Load Data
f=@(x) sin(x);
xmin=0;
xmax=2*pi;
x=linspace(xmin,xmax,25)';
y=f(x);

TrainInputs=x;
TrainTargets=y;
TrainData=[TrainInputs TrainTargets];

xx=linspace(xmin,xmax,1000)';
yy=f(xx);

TestInputs=xx;
TestTargets=yy;
TestData=[TestInputs TestTargets];


%% Design ANFIS
nMFs=5;
InputMF='gaussmf';
OutputMF='linear';

fis=genfis1(TrainData,nMFs,InputMF,OutputMF);

MaxEpoch=100;
ErrorGoal=0;
InitialStepSize=0.01;
StepSizeDecreaseRate=0.9;
StepSizeIncreaseRate=1.1;
TrainOptions=[MaxEpoch ...
              ErrorGoal ...
              InitialStepSize ...
              StepSizeDecreaseRate ...
              StepSizeIncreaseRate];

DisplayInfo=true;
DisplayError=true;
DisplayStepSize=true;
DisplayFinalResult=true;
DisplayOptions=[DisplayInfo ...
                DisplayError ...
                DisplayStepSize ...
                DisplayFinalResult];

OptimizationMethod=1;
% 0: Backpropagation
% 1: Hybrid
            
fis=anfis(TrainData,fis,TrainOptions,DisplayOptions,[],OptimizationMethod);


%% Apply ANFIS to Train Data

TrainOutputs=evalfis(TrainInputs,fis);

TrainErrors=TrainTargets-TrainOutputs;
TrainMSE=mean(TrainErrors(:).^2);
TrainRMSE=sqrt(TrainMSE);
TrainErrorMean=mean(TrainErrors);
TrainErrorSTD=std(TrainErrors);

figure;
PlotResults(TrainTargets,TrainOutputs,'Train Data');

%% Apply ANFIS to Test Data
TestOutputs=evalfis(TestInputs,fis);
TestErrors=TestTargets-TestOutputs;
TestMSE=mean(TestErrors(:).^2);
TestRMSE=sqrt(TestMSE);
TestErrorMean=mean(TestErrors);
TestErrorSTD=std(TestErrors);

figure;
PlotResults(TestTargets,TestOutputs,'Test Data');
