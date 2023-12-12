clear all
close all
clc

%% Building the neural network
NN = NeuralNetwork([1, 5, 5, 5, 1], 'tanh');

%% Defining inputs and outputs
x = (0:0.5:20)'*(1/20); % Normalized signal

% y = tan(x).*((x).^4 + (x).^3 + 2*(x).^2 - 2*(x) + sin(25*x)); % Recommended initialization: NN = NeuralNetwork([1, 7, 7, 7, 1], 'tanh');, 20k iterations, step = 0.05;
% y = 3*sin(4*x); % Recommended initialization: NN = NeuralNetwork([1, 5, 1], 'sigm'), 20k iterations, step = 0.1;
y = sin(15*x); % Recommended initialization: NN = NeuralNetwork([1, 5, 5, 1], 'tanh'), 20k iterations, step = 0.05;
% y = (x).^4 + (x).^3 + 2*(x).^2 - 2*(x) + sin(25*x); % Recommended initialization: NN = NeuralNetwork([1, 5, 5, 5, 1], 'tanh'), 20k iterations, step = 0.05;

%% Train Neural Network
NN.train(x, y, 20000, 0.05);

%% Test Neural Network
x = (0:0.1:20)'*(1/20); % Checking the network with a higher signal resolution (originally trained in lower resolution)

% Uncomment the corresponding testing function (the same as for training)
% y = tan(x).*((x).^4 + (x).^3 + 2*(x).^2 - 2*(x) + sin(25*x));
% y = 3*sin(4*x);
y = sin(15*x);
% y = (x).^4 + (x).^3 + 2*(x).^2 - 2*(x) + sin(25*x);

y_h_l = NN.test(x, 'last'); % Check prediction with latest weights/biases
y_h_b = NN.test(x, 'best'); % Check best prediction

%% Visualize Data
f = figure;

set(f, 'Position',[10 10 1800 1000]);
set(f, 'color', 'w');
sgtitle("Neural Network's Performance", 'fontweight', 'bold', 'fontsize', 30)

subplot(1, 2, 1)
plot(x, y_h_l, 'r', 'LineWidth', 5)
hold on
plot(x, y_h_b, 'b', 'LineWidth', 5)
plot(x, y, 'k', 'LineWidth', 5)
title('Performance of Neural Network', 'fontweight', 'normal', 'fontsize', 25, 'VerticalAlignment', 'bottom','HorizontalAlignment', 'center')
xlabel('x', 'fontweight', 'normal', 'fontsize', 20)
ylabel('f(x)', 'fontweight', 'normal', 'fontsize', 20)
legend('Prediction: Last training', 'Prediction: Best training', 'Exact Data')

subplot(1, 2, 2)
plot(NN.e, 'r', 'LineWidth', 5)
xlabel('Iterations', 'fontweight', 'normal', 'fontsize', 20)
ylabel('Error', 'fontweight', 'normal', 'fontsize', 20)
title('Error vs. Iterations', 'fontweight', 'normal', 'fontsize', 25)