%environment%
clf;
close all;
clear;

%constructing vehicles%
vec0 = [6,6];   % centre mass position of the vehicle 0
vec1 = [15,6];  % centre mass position of the vehicle 1
vec2 = [14,10]; %centre mass position of the vehicle 2
vec3 = [10,2] ; % centre mass position of the vehicle 3

K_lambda = 0.056; % constant coefficient
Vehicle_mass = 200; % mass of vehicle 0
Vehicle_mass1 = 260; % mass of vehicle 1
Vehicle_mass2 = 240; % mass of vehicle 2 
Vehicle_mass3 = 220; % mass of vehicle 3

velocity = 10; % velocity for all vehicle
alpha = 2;% acceleration for vehicle 0 
alpha1 = 2; % acceration for vehicle 1
alpha2 = 2;
alpha3 = 2;

beta = -0.169; % constant coefficient
tau = 2.717; % safety distance threshold

% Risky driving behavior %
%Drunk driving 1, Spedding 0.8, Drug-Impaired Driving 0.6, distracted Driving 0.4, Drowsy Driving 0.2 
DB0 = 0; % normal driving of vehicle 0
DB1 = 1; % drunk driving of vehicle 1
DB2 = 0.6; % drug-imparied driving of vehicle 2
DB3 = 0.8; % speeding of vehicle 3

% Road condition constructing%
Boundary1 = [0, 12]; % Road boundary 1
Roadlaneline1 = [0, 4]; % Roadlaneline 1
Roadlaneline2 = [0, 8]; % Roadlaneline 1
Boundary2 = [0,0];      % Road boundary 2
m_Boundary1 = 3; % field intensity for Road boundary 1
m_Roadlaneline1 = 0.5; % field intensity for Roadlaneline 1
m_Roadlaneline2 = 0.5; % field intensity for Roadlaneline 2
m_Boundary2 = 3; % field intensity for Road boundary 2

% Define the constants for the potential field
K_rep = 5; % repulsive constant
sigma = 0.45; % standard deviation of Gaussian function




x = linspace(0, 20, 400); % x-axis of workspace
y = linspace(0, 12, 400); % y-axis of workspace
[X, Y] = meshgrid(x, y); % create grid




% Calculate the potential function values for each point in the workspace
for i = 1:size(X, 1)
    for j = 1:size(X, 2)
        
        Vehicle_MIT = calculateVehicleMassInMotion(Vehicle_mass, velocity, K_lambda);
        Vehicle_MIT1 = calculateVehicleMassInMotion(Vehicle_mass1, velocity, K_lambda);
        Vehicle_MIT2 = calculateVehicleMassInMotion(Vehicle_mass2, velocity, K_lambda);
        Vehicle_MIT3 = calculateVehicleMassInMotion(Vehicle_mass3, velocity, K_lambda);
    
        vehiclepul = calculateVehicleRepulsivePotential( vec0(1), vec0(2), velocity, tau, alpha, beta, Vehicle_MIT, X(i,j), Y(i,j),DB0);
        vehiclepul1 = calculateVehicleRepulsivePotential(vec1(1), vec1(2), velocity, tau, alpha1, beta, Vehicle_MIT1, X(i,j), Y(i,j),DB1);
        vehiclepul2 = calculateVehicleRepulsivePotential(vec2(1), vec2(2), velocity, tau, alpha2, beta, Vehicle_MIT2, X(i,j), Y(i,j),DB2);
        vehiclepul3 = calculateVehicleRepulsivePotential(vec3(1), vec3(2), velocity, tau, alpha3, beta, Vehicle_MIT3, X(i,j), Y(i,j),DB3);
    
    
        d_obstacle1 = Y(i,j)- Boundary1(2);
        d_obstacle2 = Y(i,j)- Roadlaneline1(2);
        d_obstacle3 = Y(i,j)- Roadlaneline2(2);
        d_obstacle4 = Y(i,j)- Boundary2(2);
        
        
       % Calculate the repulsive potential function using a Gaussian function
        U_rep1 = K_rep * exp(-1 * (d_obstacle1 / sigma)^2)* m_Boundary1;
        U_rep2 = K_rep * exp(-1 * (d_obstacle2 / sigma)^2)* m_Roadlaneline1;
        U_rep3 = K_rep * exp(-1 * (d_obstacle3 / sigma)^2)* m_Roadlaneline2;
        U_rep4 = K_rep * exp(-1 * (d_obstacle4 / sigma)^2)* m_Boundary2;
        
        U_rep(i,j)  = U_rep1 + U_rep2 + U_rep3 + U_rep4;
        
        Y_rre =  vehiclepul + vehiclepul1 + vehiclepul2 + vehiclepul3 ;
        %Y_rre =  vehiclepul ;
        Z_rep(i,j) = Y_rre + U_rep(i,j) ;
    end
end



   
 



figure;
contourf(X, Y, Z_rep,6 );  % contour plot
colorbar;
xlabel('X');
ylabel('Y');
title('Repulsive Potential Field');
% Set the color map to a built-in MATLAB colormap (e.g. 'jet', 'hsv', 'cool', etc.)
colormap('jet');

% Add a color bar to the plot
caxis([min(Z_rep(:)), max(Z_rep(:))]);
colormap(jet); % set the colormap
c = colorbar; % create a colorbar object
c.Label.String = 'Repulsive Force'; % set the colorbar label
c.TickLabels = {'Low', '', '', '', '', '','','High'};

% Add axis labels and a title
xlabel('X');
ylabel('Y');
title('Repulsive Potential Field');

% Plot the surface plot and contour plot
figure;
surf(X, Y, Z_rep, 'EdgeColor', 'flat');
hold on;
%plot3(vec0(1), vec0(2), 0, 'r+', 'MarkerSize',5, 'LineWidth', 5);


title('Repulsive Potential Field');
xlabel('X');
ylabel('Y');
zlabel('Potential Field');

% Add a colorbar and legend to the plot
caxis([min(Z_rep(:)), max(Z_rep(:))]);
colormap(jet); % set the colormap
c = colorbar; % create a colorbar object
c.Label.String = 'Repulsive Force'; % set the colorbar label
c.TickLabels = {'Low', '', '', '', '', '','','High'};