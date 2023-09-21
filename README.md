
# Project 3-1: Angular Velocity Estimation for a Quadruped Robot

## Installation Instructions for ROS 2

Follow these steps to set up ROS 2 using Docker:

1. **Install Docker Desktop**
   - Download and install Docker Desktop from the official Docker website: [Docker Desktop](https://www.docker.com/)

2. **Create a Docker Account**
   - If you don't have one already, create a Docker account [here](https://www.docker.com/).

3. **Open Your Terminal (or PowerShell on Windows)**

4. **Run the Following Command to Start ROS 2 in a Docker Container:**
   ```bash
   docker run -d -p 6080:80 --security-opt seccomp=unconfined --shm-size=512m --name robot tiryoh/ros2-desktop-vnc:humble 

This command will pull and run a ROS 2 Docker container with a graphical user interface.

5. **Access ROS 2 GUI in Your Browser**
- Open your web browser and go to:[here](http://127.0.0.1:6080/).
  
This will open the VNC connection to the ROS 2 box.

6. **Once inside the ROS 2 container, open a terminal on Ubuntu and run ROS 2 commands as needed**

   ```bash
   ros2 run turtlesim turtlesim_node

This command will show an example of ROS 2

7. **If you want to access it Your Terminal (or PowerShell on Windows), Run this command:**
```bash
docker exec -u ubuntu -it robot /bin/bash
export DISPLAY=:1 
ros2 run turtlesim turtlesim_node
