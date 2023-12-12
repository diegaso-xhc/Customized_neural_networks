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

To run the repository, simply clone this repository and run the main.m file. Some signales have already been preprogrammed there for users to check the behavior of the framework. Next to each signal a suggested neural network structure is shown. Such structures can be easily modified if needed.

Then a window will be launched where the controllers of your main file will be simulated. 
<br />

## Contributions

The contributions of this repository can be summarized as follows:

```
- A ready to use panda-arm-robot-hand simulation.
- A simple controller framework so users can implement their controllers.
- In the next couple of months (once our work is published) we will add the algorithms required for motions in real-world.
```
## Examples of GUI usage

### Neural network to recreate a sinusoidal signal

The following figure shows the performance of a neural network created with our framework to recreate a sinusoidal wave. The exact signal can be seen in black, along with the best prediction of the network and the last trained weights:


```
- Input the transfer function: [numerator separated by commas];[denominator separated by commas]
- Click on Create Model
- Input the sampling time (dt), initial time (t(t0)), and final time in seconds.
- If the user requires a step response, click on Step response. For sine wave excitements, please input the frequency of the sine wave and click on Sine response.
- The user can then click on get time response or view frequency spectrum.
- Although visualizations for Bode and Nichols charts are not available at the moment, the user can still click them and extract the frequency responses from the library.
```

<p align="center">
   <img src="/Visualizations/sin15x.jpg" width="650" />
</p>

### Time response to a Step-like excitement signal

The following figure shows the time response of a system to a step-like excitement signal:

<p align="center">
  <img src="/Visualizations/Systems_time_response.PNG" width="650" />  
</p>


## License

Developed by Diego Hidalgo C. (2020). This repository is intended for research purposes only. If you wish to use any parts of the provided code for commercial purposes, please contact the author at hidalgocdiego@gmail.com.
