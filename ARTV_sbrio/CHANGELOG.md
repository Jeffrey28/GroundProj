Tasks:
-Understand NI obstacle avoid code
-EMI shielding?
-Work with wireless ethernet
#############################

ARTV Progress Journal

3/18
- Fixed bug with timing on manual control
- Added automatic stop on program end
-Discussed adding servo on front to act like DaNI

3/19
-Started work on manual control v2
-Bug: will not stop turning
-Bug fixed by using variable, manual control working
-Added button mapping functionality
-Started work on "stop on sight"
-Initial test: successful
-Updated StopOnSight for controllable speed and stopping distance
-Discussed wireless ethernet with Barzin

3/20
-Made a wire for a second sensor
-Connected sensor
-Started program to implement second sensor
-Made combined ground
-Tested sonar: voltage readings don't make sense
-Uninstalled servo from broken DaNI
-Finished writing code for reading with 2 sensors
-Tested StopOnSight again using higher speeds. All tests successful
-Recorded video of test
-Made connecting wire for sonar
-Looked up sonar config in datasheet
-Created program for sonar, tested: working

3/21
-Made wires for sonar sensors
-Made second sonar cable
-Connected sonars to DaNI

3/25
-Created program to read all sensors
-Encountered problem: could not connect to target board
-Resolved issue by changing IP in NI MAX
-Tested StopOnSight with different targets: black plastic, acryllic cylinder, and wood chair
-Created proportional distance controller
-Added reverse function to maintain fixed distance from target
-Testing: 
	Encountered error where board would become unresponsive
	Restarted labview to resolve
	No problems since

3/26
-Gathered materials for servo mount
-Took measurements and created hand-drawn sketch of servo mount
-Created cord for servo
-Got sbRIO datasheets from Daryl
-Modelled servo mount
-Started 3D print of servo mount
-Took measurements and made model of sonar mount

3/27
-Finished 3D prints for sonar and servo mounts
-Mounted sonar and IR sensors
-Discussed potential problem resulting from EMI
-Spoke to Kevin about connecting servo
-Looked up datasheets and researched PWM servo
-Connected servo
-One servo broken: +/- switched
-Wrote code to control servo pin for FPGA
-Created servo controller which takes input angle
-Looked through code to determine how servo oscillation is controlled
-Created code to ocillate servo between variable angles at variable increments
-Added graph, causing code to run very slowly. Needs debugging

3/28
-Tested code agian, computer crashing
-Solved issue by using timed loop to reduce processing 
-Have program working which scans for distances
-Converted servo angle code to radians
-Converted distance interpolation code to meters
-Looked through NI code for handling of scan
-Implemented vector field histogram for gap detection and obstacle detection

4/3
-Replaced mid IR with long range and updated code
-Tested: New sensor did not work
-Switched back to mid-range IR
-Requested new one
-Started new, cleaner robotics project
-Put together wish list for lab tools
-Got better data from IR datasheets

4/7
-Looked at DaNI code for converting angle and direction to motor velocities
-Started code for VFH path planning
-Researched VFH techniques
-Started angle and distance to motor controls code
-Made new cable for IR since old one was giving occasional bad readings
-Tested code to avoid obstacles: turned to avoid box but failed to recognize me
-Discovered souce of board disconnect: poor power regulation causes restart

4/8
-Charging batteries
-Gave Paul an overview of ARTV code
-Backed up current project

