##catkin_build_system

This project is designed to serve as a source installation of the catkin build system.
It pulls in `catkin`, `catkin_pkg`, and `catkin_simple` as submodules.
After building, additional catkin workspaces can be chained on top of the base workspace by sourcing the setup.bash file created during build.

####Dependencies
The following system dependencies are needed to correctly configure and build this base catkin workspace:
```
sudo apt-get install cmake build-essential python-dev python-empy python-nose
```

