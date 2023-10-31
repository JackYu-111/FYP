# Vehicle Interaction Analysis 🚗💨

Welcome to the Vehicle Interaction Analysis project! This MATLAB-based endeavor explores the dynamic world of vehicular interactions, simulating potential fields to analyze driving scenarios and behaviors.

## Overview

This project is designed to:
- Simulate vehicle interactions in a potential field environment.
- Calculate repulsive forces based on vehicle positions, velocities, and road conditions.
- Visualize and understand potential risks and behaviors in various driving scenarios.

## Project Structure

- **`calculateK2.m`**: MATLAB function for computing the repulsive potential between two vehicles.

    **Inputs:**
    - `x0, y0`: Reference point (object car center mass).
    - `velocity`: Velocity parameter.
    - `tau`: Safety distance threshold.
    - `alpha`: Acceleration of the object.
    - `beta`: Constant coefficient.
    - `M`: Car in motion mass.
    - `x_v2, y_v2`: Coordinates of the other car.
    - `DB`: Driving behavior (drunk driving, speeding, etc.).

    **Outputs:**
    - `vehiclepul`: Calculated repulsive potential.

- **`vehicle_mass_in_motion.m`**: MATLAB function to determine the mass of a vehicle in motion.

    **Inputs:**
    - `mass`: Mass of the vehicle.
    - `velocity`: Velocity parameter.
    - `K_lambda`: Constant coefficient.

    **Outputs:**
    - `M`: Calculated mass of the vehicle in motion.

- **`simulatePotentialField.m`**: MATLAB script to visualize the potential field and analyze vehicle interactions.

## Usage

1. Ensure you have MATLAB installed.
2. Run the `simulatePotentialField.m` script to embark on a visual journey through the potential field landscape.

## Parameters

### Vehicle Parameters:
- **Mass**: Mass of each vehicle.
- **Velocity & Acceleration**: Speed and acceleration of each vehicle.
- **Driving Behaviors**: Drunk driving, Speeding, Drug-Impaired Driving, Distracted Driving, Drowsy Driving.

### Road Conditions:
- **Boundaries & Lane Lines**: Define road boundaries and lane lines.
- **Field Intensities**: Adjust field intensities for road boundaries and lane lines.

### Simulation Constants:
- **Repulsive Constants**: Tune the strength of repulsive forces.
- **Standard Deviation**: Adjust Gaussian function standard deviation.

## Expected Results

Observe mesmerizing visualizations of the repulsive potential field, showcasing the intricate dance of vehicle interactions and road conditions. Analyze how different driving behaviors and road conditions influence the simulated potential field.
