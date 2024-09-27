# Fuzzy-Systems  
**Programs regarding the course of fuzzy systems - AUT.**  

This repository contains two key projects: one focused on function approximation using ANFIS, and the other on optimizing a Fuzzy Logic Controller (FLC) for an inverted pendulum system using genetic algorithms.

## 1. ANFIS for Function Approximation  
In Project ANFIS, an adaptive neuro-fuzzy model is used to approximate a sine function. This hybrid system combines fuzzy logic's interpretability with neural networks' learning capabilities. The FIS is generated using training data, and a hybrid method is applied to optimize fuzzy rules and membership functions. This allows the ANFIS to learn and fine-tune its parameters for accurate function approximation.

A set of MATLAB scripts defines input-output relationships based on the sine function. A predefined number of membership functions (typically 3-5) are tuned during training. Performance is measured using standard metrics such as the Root Mean Square Error (RMSE). The `PlotResults` function visualizes the system’s predictions against the target sine function and shows error distributions.

## 2. Tuning Fuzzy Logic Controller Parameters and Rules by Genetic Algorithm  
The goal of this project is to optimize the FLC applied to a highly nonlinear inverted pendulum system, a classic testbed for advanced control techniques. Using MATLAB’s Genetic Algorithm (GA) Toolbox, the fuzzy rules, membership functions, and control gains are tuned to keep the pendulum upright while minimizing control efforts and errors.

This project includes both single-objective (minimizing angle error) and multi-objective (adding control input minimization) approaches, providing flexibility for various control problems. The code allows for customization, making it suitable for systems beyond the inverted pendulum.

### Simulation and Optimization  
Key files include:
- **`Inverted_Pendulum_Model.m`** – Models the nonlinear dynamics of the pendulum.
- **`app1.m`** – Handles single-objective optimization.
- **`app2.m`** – Handles multi-objective optimization.

The optimization process tunes the FLC parameters to balance the pendulum under varying conditions.

### Visualization and Results  
Both projects use MATLAB’s built-in plotting functions to visualize results. In ANFIS, `PlotResults` compares predicted outputs to actual data, displaying error metrics like RMSE. In the FLC optimization, the system's ability to stabilize the pendulum is demonstrated through time plots. Optimized fuzzy rules and membership functions are saved for future use or further tuning.
