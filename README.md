Fuzzy-Systems
Programs regarding the course of fuzzy systems - AUT.

This repository contains basically two key projects: one on the function approximation using ANFIS and another one on optimization of a FLC for an inverted pendulum system by genetic algorithms.

1. ANFIS for Function Approximation
In Project ANFIS, an adaptive neuro-fuzzy model is used for the approximation of a sine function. The hybrid system to be developed will combine the fuzzy logic interpretability with the learning ability of neural networks. By implementation, it generates a FIS using training data and applies a hybrid method for the optimization of fuzzy rules and membership functions. This method enables the ANFIS to learn from data and tune its parameters to attain any desired level of accuracy.

Input-output relationships are defined by a set of MATLAB scripts based on the sine function. Then, there is a set number of membership functions, normally three to five, as stated for the inputs, which get tuned through the training process. Standard metrics such as the Root Mean Square Error are used to measure system performance. Then, this function PlotResults visualizes the results after training by plotting the system predictions against the target sine function and distributions of error.

2. Tuning Fuzzy Logic Controller Parameters and Rules by Genetic Algorithm
The goal of this repository's second project is the optimization of the FLC applied to an inverted pendulum system. The pendulum system is highly nonlinear and thus acts as a very good testbed for various advanced control techniques. The application of the Genetic Algorithm, GA Toolbox from MATLAB, is therefore meant to optimize the FLC by tuning the fuzzy rules, membership functions, and control gains with the aim of keeping the pendulum upright while minimizing the control efforts and error.

This project contains both single-objective and multi-objective optimization approaches. In the former case, the GA minimizes one objective, an angle error between the pendulum's actual and desired position. The latter multiobjective optimization expands the criteria by adding a term to minimize control input hence providing a trade-off between performance and effort. This code enables flexible tuning and customization and therefore is suitable for a wide range of control problems other than the inverted pendulum.

Simulation and Optimization
These include the following key simulation files: Inverted_Pendulum_Model.m - model of nonlinear pendulum dynamics. In the following simulations, GA is used for tuning the parameters of the FLC; the performance of the latter is measured by running the simulations in time. The files app1.m and app2.m handle the optimization for single and multi-objective cases respectively. These scripts will ensure that the optimized FLC will balance the pendulum under a number of conditions.

Visualization and Results
The results of both the ANFIS and FLC projects are visualized using the built-in plotting functions of MATLAB. The PlotResults function in ANFIS also plots predicted outputs against the actual target data, and show error metrics such as the RMSE. In contrast, the FLC optimization project will visualize the performance of various optimized solutions in time plots, showing how well the system can stabilize the pendulum. The optimized membership functions, together with the fuzzy rules, are stored for possible later deployment or further optimization.
