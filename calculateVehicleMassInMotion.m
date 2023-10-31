function M = vehicle_mass_in_motion(mass, velocity, K_lambda)
    %Calculate the mass of vehicle in motion

    M = mass.* (1.566e-14 * velocity^6.687 + 0.3345) * K_lambda;
	end 