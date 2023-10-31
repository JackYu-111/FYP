function vehiclepul = calculateVehicleRepulsivePotential(x0, y0, velocity, tau, alpha, beta, M, x_v2, y_v2, DB)
% Calculates vehiclepul based on the inputs x, y, x0, y0, v, d, t, alpha, and k
% Inputs:
%   vx: , x-coordinate of the point (the direction of car moving)
%   vy: , y-coordinate of the point (the direction of car moving)
%   x0: , x-coordinate of the reference point (object car centre mass)
%   y0: , y-coordinate of the reference point (object car centre mass)
%   velocity:  velocity parameter
%   alpha: acceleration of the object
%   blpha: constant
%   M: car in motion mass
%   x_v2:  x-coordinate of the other car
%   y_v2:  y-coordinate of the other car

% Calculate distance between two points
    

     % Calculate the firstpart and secondpart separately(pseduo
        if velocity == 0 && alpha == 0
            firstpart = ((x_v2 - x0)*tau).^2 ;
            secondpart =((y_v2 - y0)*tau)^2 ;
        elseif alpha == 0
            firstpart = ((x_v2 - x0)* exp(tau/velocity)).^2  ;
            secondpart =((y_v2 - y0)* tau)^2 ;
        else
            firstpart = ((x_v2 - x0)*(exp(tau/(alpha*velocity)))).^2 ;
            secondpart =((y_v2 - y0)*(tau))^2 ;
        end
%  theta 
   velocity_direction = 45; % degree
   theta = atan2(y_v2- y0,x_v2 - x0) + (0);   
        
        
    
        if theta < 0
        theta = theta + 2*pi;
        end


% Calculate the firstpart and secondpart separately(pesduo
    
    % Calculate K as the square root of the sum of firstpart and
    % secondpart,and it is a distance between two car
    K= sqrt(firstpart + secondpart);
    
    

% Calculate vehicle repulsive potetial 
    if K > 10000000
        vehiclepul = 0;
    else
       vehiclepul = M *(exp(-beta*alpha*cos(theta)) * (1+DB)/ K)* K/abs(K);
    end 
    if isinf(vehiclepul) == 1 || vehiclepul > 10
        vehiclepul = 15;
    end
    
end

