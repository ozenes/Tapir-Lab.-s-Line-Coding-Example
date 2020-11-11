bits = [1 0 1 0 0 1 1 1 0 ];              % Input
T = length(bits);                              % Lenght of input
n = 100;                                           % Oversampling rate
x = zeros(1,length(bits)*n);            % Output array

for i = 0:length(bits)-1                    
  if bits(i+1) == 1                             % Control of input
    x(i*n+1:(i+1)*n) = 1;                    % NRZ Encoding for input "1"
    x((i+1)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+1)*n) = 0;                     % NRZ Encoding for input "0"
    x((i+1)*n+1:(i+1)*n) = 1;
  end
end

figure;                                                 % Ploting the figure
plot(x,'LineWidth',3); grid on
title('NRZ Encoding')
set(gca,'YTick',[0:1]);
ylabel('Output') 