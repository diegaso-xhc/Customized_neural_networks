# Customized_neural_networks

## Overview of the repository
<div align="justify">
Neural networks are widely used in recent years. They can be considered the entry point to modern machine and deep learning techniques. This repository aims to providing an easy to use customizable framework for neural networks. With our fully open code, users could have an initial understanding on how neural networks work and build upon this code to execute more sophisticated tasks. This repository is a great alternative for teaching purposes and for training neural networks which can be easily deployed in hardware level, such as microcontrollers after selecting optimal weights and biases. 
<br />
<br />
This repository was developed in MATLAB. It allows users to customize easily a neural network with as many layers and nodes as required. It also keeps of the best combination of weights and biases for testing. 
<br />
<br />

<p align="center">
   <img src="/Visualizations/3sin4x.jpg" width="700" />
</p>

<br />

## Understanding repository

The repository was developed using the following software version:

```
- Ubuntu 20.04.5 LTS
- Matlab 2023b
```

To run the repository, simply clone this repository and run the main.m file. Some signales have already been preprogrammed there for users to check the behavior of the framework. Next to each signal a suggested neural network structure is shown. Such structures can be easily modified if needed. Finally a plot will be launched comparing the expected exact signals with the performance of your network. 
<br />

## Examples of GUI usage

### Neural network to recreate a sinusoidal signal

The following figure shows the performance of a neural network created with our framework to recreate a sinusoidal wave. The exact signal can be seen in black, along with the best prediction of the network and the last trained weights:

<p align="center">
   <img src="/Visualizations/sin15x.jpg" width="700" />
</p>

### Neural network to recreate a polinomial signal

The following figure shows the performance of a neural network created with our framework to recreate a polinomial wave. The exact signal can be seen in black, along with the best prediction of the network and the last trained weights:

<p align="center">
  <img src="/Visualizations/polinomial.jpg" width="700" />  
</p>

### Neural network to recreate a polinomial-trigonometrical signal

The following figure shows the performance of a neural network created with our framework to recreate a complicated signal mixing polinomial and trinometrical behaviors. The exact signal can be seen in black, along with the best prediction of the network and the last trained weights:

<p align="center">
  <img src="/Visualizations/tan_plonomial.jpg" width="700" />  
</p>

## License

Developed by Diego Hidalgo C. (2020). This repository is intended for research purposes only. If you wish to use any parts of the provided code for commercial purposes, please contact the author at hidalgocdiego@gmail.com.
