import numpy as np


# TODO: Change noise (mean, STD) as experimental params --> observe accuracy of KF
# https://stats.stackexchange.com/questions/40466/how-can-i-debug-and-check-the-consistency-of-a-kalman-filter

# Seed for reproducibility
SEED = 0
# Time
TIME_STEP = 0.1  # How frequently state is updated
TOTAL_TIME = 0.5  # How long (hours) simulation is run for (including last value)
TIME = [round(TIME_STEP * i, 3) for i in range(int(TOTAL_TIME / TIME_STEP)+1)]  # Array of all recorded times
NUM_OBSERVATIONS = len(TIME)

# Noise
VELOCITY_VAR = 0.1
MEASUREMENT_MEAN = 0
MEASUREMENT_VAR = 0.01


def get_ideal_position(ideal_velocity, t):
    return round(ideal_velocity*t, 3)


def get_real_velocity():
    return np.random.normal(IDEAL_VELOCITY, VELOCITY_VAR)


def get_real_position(previous_position, velocity):
    return previous_position + velocity*TIME_STEP


def get_measurement(real_position):
    # Clipped to ensure robot is not going backwards
    return max(0, np.random.normal(real_position + MEASUREMENT_MEAN, MEASUREMENT_VAR))


# Generating ideal [position, velocity]
IDEAL_VELOCITY = 4  # kmh
IDEAL_POSITIONS = [get_ideal_position(IDEAL_VELOCITY, TIME[i]) for i in range(NUM_OBSERVATIONS)]

# Generating real [position, velocity]
np.random.seed(SEED)
# Real position is not due to noise, but as result of real (noisy) velocity
# Real velocity of robot at every time step
real_velocity = [get_real_velocity() for i in range(NUM_OBSERVATIONS)]
# Real positions according to real velocity
real_positions = [0.0]
for i in range(NUM_OBSERVATIONS-1):
    real_positions.append(get_real_position(real_positions[-1], real_velocity[i]))

# Generating measured position
measurements = [get_measurement(real_positions[i]) for i in range(NUM_OBSERVATIONS)]

# Printing results
print(f"Time intervals: ", TIME)
print(f"Ideal positions: ", IDEAL_POSITIONS)
print(f"Real positions: ", real_positions)
print(f"Measured positions: ", measurements)
