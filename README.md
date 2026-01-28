# Kinematics & Control for Mobile Manipulator Robot 🤖

### 🚀 Project Overview
Development of the control algorithms for a **"Manipmobile"** (a robotic arm mounted on a mobile wheeled base).
The project focused on solving the **Inverse Kinematics (IK)** problem to allow the robot to execute precise trajectories while managing the redundancy of the mobile base.

**Key Achievement:** Bridging the gap between simulation and reality by validating the control laws on both a MATLAB digital twin and the physical robot.

---

### 🎥 Simulation & Experimental Setup
*Comparison between the digital twin and the physical implementation.*

| **Digital Twin (MATLAB)** | **Physical Experimental Setup** |
|:-------------------------:|:-----------------------------:|
| ![Simulation Demo](simulation_demo.gif) | ![Real Robot Hardware](real_robot_setup.png) |
| *Real-time simulation of the IK solver.* | *Validation on the mobile manipulator.* |

---

### 🛠 Tech Stack & Algorithms
* **Simulation:** MATLAB / Robotics Toolbox.
* **Maths:** Jacobian Matrices, Denavit-Hartenberg (DH) Parameters.
* **Optimization:** Damped Least Squares (Levenberg-Marquardt) for singularity handling.

---

### 📐 Technical Deep Dive

#### 1. Inverse Kinematics (The Math)
To move the end-effector to a target Cartesian point $X$, we must calculate the joint angles $q$.
Since the forward kinematics function $X = f(q)$ is non-linear and redundant, I implemented an **iterative numerical solver**:

$$\dot{q} = J^{\dagger} \cdot \dot{X}$$

Where $J^{\dagger}$ is the **Pseudo-Inverse** of the Jacobian matrix.

#### 2. Handling Singularities
**Problem:** Near singularities (e.g., arm fully extended), the Jacobian determinant $\approx 0$, causing velocity spikes.
**Solution:** Implementation of the **Damped Least Squares (DLS)** method to stabilize the inversion:
$$\dot{q} = J^T (JJ^T + \lambda^2 I)^{-1} \dot{X}$$

---

### 📈 Trajectory Tracking Results
**Performance Analysis (Sinusoidal Path):**
The graph below demonstrates the robot's ability to track a time-varying trajectory.

* **Dashed Lines (--):** Reference Trajectory (The target input).
* **Solid Lines (—):** Actual End-Effector Position (The output).

**Observation:** The perfect overlap between the solid and dashed lines confirms the accuracy of the Inverse Kinematics algorithm and the low latency of the control loop.

![Sinusoidal Tracking Results](sinusoidal_tracking.png)

---

### 💻 Code Logic Snippet (Matlab)

*Core logic of the iterative solver:*

```matlab
function [q_dot] = damped_least_squares(J, error_X, lambda)
    % J: Jacobian Matrix
    % error_X: Cartesian velocity vector toward target
    % lambda: Damping factor (leaks) to handle singularities

    % Calculate Damped Inverse
    % Formula: J_dls = J' * inv(J*J' + lambda^2 * Identity)
    J_dls = J' * inv(J*J' + lambda^2 * eye(size(J,1)));
    
    % Compute Joint Velocities
    q_dot = J_dls * error_X;
end
