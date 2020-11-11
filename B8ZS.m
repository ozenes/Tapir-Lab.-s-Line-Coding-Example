bits = [1 0 1 0 0 0 0 0 0 0 0 0 0 1 1 1 0];              % Input
T = max(size(bits));                                                  % Lenght of input
n = 100;                                                                    % Oversampling rate
x = zeros(1,length(bits)*n);                                     % Output array
y = -1;                                                                        % For Bipolar Encoding  
counter = 0;                                                              % Counter for count zeros

for j = 0:length(bits)-1
  if (bits(j+1) == 0)                                                    % Control of input
    counter = counter + 1;  
if (counter == 8)
      x((j-8)*n+1:(j-7)*n) = 0;                                        % B8ZS Encoding for 8 consecutive "0"
      x((j-7)*n+1:(j-6)*n) = 0;
      x((j-6)*n+1:(j-5)*n) = 0;	
      x((j-5)*n+1:(j-4)*n) = y;
      x((j-4)*n+1:(j-3)*n) = -y;
      y = -y;
      x((j-3)*n+1:(j-2)*n) = 0;
      x((j-2)*n+1:(j-1)*n) = y;
      x((j-1)*n+1:j*n) = -y;
      y = -y;
      counter = 0;
else
    counter = 0;                                                            
    x((j-1)*n+1:j*n) = -y;                                                  % B8ZS Encoding for input "1"
    y = -y;
end
  end
end

figure;                                             % Ploting the figure
plot(x,'LineWidth',3); grid on
title('B8ZS Encoding')
set(gca,'YTick',[-1:1]);
ylabel('Output Level') 