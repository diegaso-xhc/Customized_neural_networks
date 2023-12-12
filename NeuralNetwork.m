classdef NeuralNetwork < handle
    properties
        layout % Layout of the NN
        act_fun % Type of activation function
        n_inp % Number of inputs
        n_out % Number of outputs
        n_lay % Number of layers
        w % Weights
        b % Biases
        e % Error
        e_min % Minimum error
        best_w % Best weights 
        best_b % Best biases
    end
    methods
        function obj = NeuralNetwork(layout, act_fun)
            obj.layout = layout;
            obj.act_fun = act_fun;  
            obj.n_inp = layout(1);
            obj.n_out = layout(end);
            obj.n_lay = size(layout, 2) - 2;
            obj.w = cell(1, obj.n_lay + 1); % Initialization of a cell containing all weights
            obj.b = cell(1, obj.n_lay + 1); % Initialization of a cell containing all biases
            obj.initialize_ws_bs();
        end
        function initialize_ws_bs(obj)
            for i = 1: obj.n_lay + 1
                % Initialization of weights and biases
                obj.w{1, i} = rand(obj.layout(i + 1), obj.layout(i));
                obj.b{1, i} = rand(obj.layout(i + 1), 1);
            end
        end
        function train(obj, x_inp, y_out, epoch, alph)            
            z = cell(1, obj.n_lay + 1);
            n = obj.layout(end);
            c = zeros(n, 1);
            bz = z;
            dW = obj.w;                        
            str_bck = strcat('de', obj.act_fun);
            obj.e_min = 0;            
            for t = 1: epoch
                for k = 1: size(x_inp, 1)
                    % Forward path
                    for i = 1: obj.n_lay + 1
                        if i == 1
                            X = x_inp(k);
                        else
                            X = z{1, i - 1};
                        end
                        z{1, i} = obj.w{1, i} * X + obj.b{1, i};
                        if i ~= obj.n_lay + 1
                            z{1, i} = NeuralNetwork.activ(z{1, i}, obj.act_fun);
                        end
                    end
                    % Backpropagation
                    X = x_inp(k);
                    obj.e(t) = (1/n)*(y_out(k) - z{1, end}).*(y_out(k) - z{1, end});                    
                    c = 2*(1/n)*(y_out(k) - z{1, end})*-1;
                    for i = obj.n_lay + 1:-1:1
                        if i == obj.n_lay + 1
                            bz{1, i} = c.*NeuralNetwork.de_activ(z{1, i}, str_bck);
                        else
                            bz{1, i} = obj.w{1, i+1}'*bz{1, i+1}.*NeuralNetwork.de_activ(z{1, i}, str_bck);
                        end
                        if i ~= 1
                            dW{1, i} = repmat(bz{1, i}, 1, obj.layout(i))*diag(z{1, i - 1});
                        else
                            dW{1, i} = repmat(bz{1, i}, 1, obj.layout(i))*diag(X);
                        end
                    end
                    % Update weights and biases
                    for i = 1: length(obj.w)
                        obj.w{i} = obj.w{i} - alph*dW{i};
                    end
                    for i = 1: length(obj.b)
                        obj.b{i} = obj.b{i} - alph*bz{i};
                    end
                    % Save minimum error for best weights and biases
                    if t == 1 && k == 1
                        obj.e_min = obj.e(t);
                    else
                        [obj.e_min, id] = min([obj.e_min, obj.e(t)]);                        
                        if id == 2
                            obj.best_w = obj.w;
                            obj.best_b = obj.b;                            
                        end
                    end
                end
            end
        end
        function y_h = test(obj, x_inp, type)
            %% Test Neural Network
            y_h = zeros(size(x_inp));
            if strcmp(type, 'best')
                for k = 1: length(x_inp)
                    for i = 1: obj.n_lay + 1
                        if i == 1
                            X = x_inp(k);
                        else
                            X = z{1, i - 1};
                        end
                        z{1, i} = obj.best_w{1, i} * X + obj.best_b{1, i};
                        if i ~= obj.n_lay + 1
                            z{1, i} = NeuralNetwork.activ(z{1, i}, obj.act_fun);
                        end
                    end
                    y_h(k) = z{1, obj.n_lay + 1};
                end
            elseif strcmp(type, 'last')                
                for k = 1: length(x_inp)
                    for i = 1: obj.n_lay + 1
                        if i == 1
                            X = x_inp(k);
                        else
                            X = z{1, i - 1};
                        end
                        z{1, i} = obj.w{1, i} * X + obj.b{1, i};
                        if i ~= obj.n_lay + 1
                            z{1, i} = NeuralNetwork.activ(z{1, i}, obj.act_fun);
                        end
                    end
                    y_h(k) = z{1, obj.n_lay + 1};
                end
            end
        end
    end
    methods (Static)
        function y = activ(x, str)
            m = size(x, 1);
            n = size(x, 2);
            y = zeros(m, n);
            if strcmp(str, 'sigm')
                for i = 1: m
                    for j = 1: n
                        y(i, j) = 1 / (1 + exp(-x(i, j)));
                    end
                end
            elseif strcmp(str, 'tanh')
                for i = 1: m
                    for j = 1: n
                        y(i, j) = (exp(x(i, j)) - exp(-x(i, j))) / (exp(x(i, j)) + exp(-x(i, j)));
                    end
                end
            elseif strcmp(str, 'relu')
                for i = 1: m
                    for j = 1: n
                        if x(i, j) <= 0
                            y(i, j) = 0;
                        else
                            y(i, j) = x(i, j);
                        end
                    end
                end
            elseif strcmp(str, 'lin')
                for i = 1: m
                    for j = 1: n
                        y(i, j) = x(i, j);
                    end
                end
            end
        end
        function y = de_activ(x, str)
            m = size(x, 1);
            n = size(x, 2);
            y = zeros(m, n);
            if strcmp(str, 'desigm')
                for i = 1: m
                    for j = 1: n
                        s = activ(x, 'sigm');
                        y = s.*(1-s);
                    end
                end
            elseif strcmp(str, 'detanh')
                for i = 1: m
                    for j = 1: n
                        y(i, j) = (2 / (exp(x(i, j) + exp(-x(i, j))))) * (2 / (exp(x(i, j) + exp(-x(i, j)))));
                    end
                end
            elseif strcmp(str, 'derelu')
                for i = 1: m
                    for j = 1: n
                        if x(i, j) <= 0
                            y(i, j) = 0;
                        else
                            y(i, j) = 1;
                        end
                    end
                end
            elseif strcmp(str, 'delin')
                for i = 1: m
                    for j = 1: n
                        y(i, j) = 1;
                    end
                end
            end
        end
    end
end