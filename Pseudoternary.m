bits = [1 0 1 0 0 1 1 1 0 ];              % Input
T = max(size(bits));                         % Lenght of input
n = 100;                                           % Oversampling rate
x = zeros(1,length(bits)*n);            % Output array
y = -1;                                               % For Bipolar Encoding  

for i = 0:length(bits)-1
  if bits(i+1) == 0                             % Control of input
    x(i*n+1:(i+1)*n) = -y * 1;          
    x((i+1)*n+1:(i+1)*n) = -y * -1;    % Pseudoternary Encoding for input "0"
    
  else 
  y = y* -1;
    x(i*n+1:(i+1)*n) = 0;                   % Pseudoternary Encoding for input "1"
    x((i+1)*n+1:(i+1)*n) = 0;
  end
end

figure;                                                         % Ploting the figure
plot(x,'LineWidth',3); grid on
title('Pseudoternary Encoding')
set(gca,'YTick',[-1:1]);
ylabel('Output Level') 