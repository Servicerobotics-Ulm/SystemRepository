#!/bin/bash

startUpCode1="(load-coordination-interface \"FleetManagerCoordinationService\" \".\")\n
             (read-coordination-module-system-file (format nil \"~a/connections-ci-interface-test.json\" \".\"))\n
			 (instantiate-coordination-module \"FleetManager\" 'FleetManager)\n
			 (execute '(FleetManager.addRobotToFleetRequest))\n
			 (execute '(FleetManager.addRobotToFleet))\n
			 (tcl-kb-register-chained-entry :key '(is-a) :value \`((is-a location)))\n
			 (tcl-kb-register-chained-entry :key '(is-a) :value \`((is-a station)))\n
             (tcl-kb-register-chained-entry :key '(is-a) :value \`((is-a station-type)))\n
             (tcl-kb-register-chained-entry :key '(is-a) :value \`((is-a rack)))\n
             (tcl-kb-register-chained-entry :key '(is-a) :value \`((is-a object-class)))\n"
             
find ./SystemWebotsRobotinoSlave.deployment/ComponentKB_Robotino_1.ini -type f -exec sed -z -i -e 's/\[kbChainedEntriesEventClient\]\nwiringName kbChainedEntriesEventClient\nserverName unknown\nserviceName unknown/\[kbChainedEntriesEventClient\]\nwiringName kbChainedEntriesEventClient\nserverName ComponentKB_Master\nserviceName kbEventServer/g' {} \;

find ./SystemWebotsRobotinoSlave.deployment/ComponentGoalNodeControl_Robotino_1.ini -type f -exec sed -z -i -e 's/\[ShortestPathRequestServiceReq\]\nwiringName ShortestPathRequestServiceReq\nserverName unknown\nserviceName unknown\ninitialConnect false/\[ShortestPathRequestServiceReq\]\nwiringName ShortestPathRequestServiceReq\nserverName ComponentNavigationGraph\nserviceName ShortestPathRequestServiceAnsw\ninitialConnect true/g' {} \;

find ./SystemWebotsRobotinoSlave.deployment/ComponentGoalNodeControl_Robotino_1.ini -type f -exec sed -z -i -e 's/\[NodeStatusUpdateServiceReq\]\nwiringName NodeStatusUpdateServiceReq\nserverName unknown\nserviceName unknown\ninitialConnect false/\[NodeStatusUpdateServiceReq\]\nwiringName NodeStatusUpdateServiceReq\nserverName ComponentNavigationGraph\nserviceName NodeStatusUpdateServiceAnsw\ninitialConnect true/g' {} \;

find ./SystemWebotsRobotinoSlave.deployment/ComponentGoalNodeControl_Robotino_1.ini -type f -exec sed -z -i -e 's/\ClosestFreeNodeServiceReq\]\nwiringName ClosestFreeNodeServiceReq\nserverName unknown\nserviceName unknown\ninitialConnect false/\ClosestFreeNodeServiceReq\]\nwiringName NodeStatusUpdateServiceReq\nserverName ComponentNavigationGraph\nserviceName ClosestFreeNodeServiceAnsw\ninitialConnect true/g' {} \;

rm -rf SystemWebotsRobotinoSlave_*.deployment

cp -r SystemWebotsRobotinoSlave.deployment SystemWebotsRobotinoSlave_1.deployment

echo "Enter the number of robots:" $numberRobots
read numberRobots

echo "Enter the start pose of robot 1:"
read start1

echo "Enter the initial waypoint (waypoint id) of robot 1 (nil if no waypoint acquired initially):"
read location1

echo -e $startUpCode1 > SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl
echo -e "(execute '(localizationModInst.localizationSetRobotPose $start1))" >> SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl
echo -e "(tcl-kb-update :key '(is-a name) :value \`((is-a robot)(name 1)(current-waypoint $location1)))" >> SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl

if [ $location1 != "nil" ]; then
   echo -e "(execute '(navPathClient.acquireInitialWaypoint))" >> SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl
fi

echo -e "(execute '(tcb-update-robot-state 'IDLE))" >> SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl
echo -e "(execute '(FleetManager.waitForCommands))" >> SystemWebotsRobotinoSlave_1.deployment/behaviorFiles/startUp.smartTcl

for ((i = 2; i <= $numberRobots; i++))
do
	cp -r SystemWebotsRobotinoSlave_1.deployment SystemWebotsRobotinoSlave_$i.deployment 
	cd SystemWebotsRobotinoSlave_$i.deployment
	
	echo "Enter the start pose of robot $i:"
	read start

	echo "Enter the initial waypoint (waypoint id) of robot $i (nil if no waypoint acquired initially):"
	read location

	echo -e $startUpCode1 > behaviorFiles/startUp.smartTcl
	echo -e "(execute '(localizationModInst.localizationSetRobotPose $start))" >> behaviorFiles/startUp.smartTcl
	echo -e "(tcl-kb-update :key '(is-a name) :value \`((is-a robot)(name $i)(current-waypoint $location)))" >> behaviorFiles/startUp.smartTcl

	if [ $location != "nil" ]; then
	   echo -e "(execute '(navPathClient.acquireInitialWaypoint))" >> behaviorFiles/startUp.smartTcl
	fi

	echo -e "(execute '(tcb-update-robot-state 'IDLE))" >> behaviorFiles/startUp.smartTcl
	echo -e "(execute '(FleetManager.waitForCommands))" >> behaviorFiles/startUp.smartTcl
	
	find ./ -type f -exec sed -i -e 's/SmartCdlServer_Robotino_1/SmartCdlServer_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentTCLSequencer_Robotino_1/ComponentTCLSequencer_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentWebotsMobileRobot_Robotino_1/ComponentWebotsMobileRobot_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentRobotToRobotDocking_Robotino_1/ComponentRobotToRobotDocking_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentSeq2SeqCom_Robotino_1/ComponentSeq2SeqCom_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentWebotsConveyorBeltOpcua_Robotino_1/ComponentWebotsConveyorBeltOpcua_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentWebotsMpsDocking_Robotino_1/ComponentWebotsMpsDocking_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/SmartAmcl_Robotino_1/SmartAmcl_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentKB_Robotino_1/ComponentKB_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/SmartMapperGridMap_Robotino_1/SmartMapperGridMap_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentWebots2DLidar_Robotino_1/ComponentWebots2DLidar_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/SmartPlannerBreadthFirstSearch_Robotino_1/SmartPlannerBreadthFirstSearch_Robotino_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/ComponentGoalNodeControl_Robotino_1/ComponentGoalNodeControl_Robotino_'$i'/g' {} \;
	
	find ./behaviorFiles -type f -exec sed -i -e 's/SystemWebotsRobotinoSlave_'$1'/SystemWebotsRobotinoSlave_'$2'/g' {} \;
	
	mv SmartCdlServer_Robotino_1_data "SmartCdlServer_Robotino_"$i"_data"
	mv SmartCdlServer_Robotino_1.ini SmartCdlServer_Robotino_$i.ini

	mv ComponentTCLSequencer_Robotino_1_data "ComponentTCLSequencer_Robotino_"$i"_data"
	mv ComponentTCLSequencer_Robotino_1.ini ComponentTCLSequencer_Robotino_$i.ini

	mv ComponentWebotsMobileRobot_Robotino_1_data "ComponentWebotsMobileRobot_Robotino_"$i"_data"
	mv ComponentWebotsMobileRobot_Robotino_1.ini ComponentWebotsMobileRobot_Robotino_$i.ini

	mv ComponentRobotToRobotDocking_Robotino_1_data "ComponentRobotToRobotDocking_Robotino_"$i"_data"
	mv ComponentRobotToRobotDocking_Robotino_1.ini ComponentRobotToRobotDocking_Robotino_$i.ini 

	mv ComponentSeq2SeqCom_Robotino_1_data "ComponentSeq2SeqCom_Robotino_"$i"_data"
	mv ComponentSeq2SeqCom_Robotino_1.ini ComponentSeq2SeqCom_Robotino_$i.ini
	  
	mv ComponentWebotsConveyorBeltOpcua_Robotino_1_data "ComponentWebotsConveyorBeltOpcua_Robotino_"$i"_data"
	mv ComponentWebotsConveyorBeltOpcua_Robotino_1.ini ComponentWebotsConveyorBeltOpcua_Robotino_$i.ini
	  
	mv ComponentWebotsMpsDocking_Robotino_1_data "ComponentWebotsMpsDocking_Robotino_"$i"_data"  
	mv ComponentWebotsMpsDocking_Robotino_1.ini ComponentWebotsMpsDocking_Robotino_$i.ini

	mv SmartAmcl_Robotino_1_data "SmartAmcl_Robotino_"$i"_data"  
	mv SmartAmcl_Robotino_1.ini SmartAmcl_Robotino_$i.ini 

	mv ComponentKB_Robotino_1_data "ComponentKB_Robotino_"$i"_data"    
	mv ComponentKB_Robotino_1.ini ComponentKB_Robotino_$i.ini
	  
	mv SmartMapperGridMap_Robotino_1_data "SmartMapperGridMap_Robotino_"$i"_data"
	mv SmartMapperGridMap_Robotino_1.ini SmartMapperGridMap_Robotino_$i.ini 
	  
	mv ComponentWebots2DLidar_Robotino_1_data "ComponentWebots2DLidar_Robotino_"$i"_data"  
	mv ComponentWebots2DLidar_Robotino_1.ini ComponentWebots2DLidar_Robotino_$i.ini 

	mv SmartPlannerBreadthFirstSearch_Robotino_1_data "SmartPlannerBreadthFirstSearch_Robotino_"$i"_data" 
	mv SmartPlannerBreadthFirstSearch_Robotino_1.ini SmartPlannerBreadthFirstSearch_Robotino_$i.ini

	mv ComponentGoalNodeControl_Robotino_1_data "ComponentGoalNodeControl_Robotino_"$i"_data"
	mv ComponentGoalNodeControl_Robotino_1.ini ComponentGoalNodeControl_Robotino_$i.ini
	
	find ./ -type f -exec sed -i -e 's/Robotino3_1/Robotino3_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/Lidar_1/Lidar_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/MpsDocking_1/MpsDocking_'$i'/g' {} \;
	find ./ -type f -exec sed -i -e 's/RobotinoConveyorBelt_1/RobotinoConveyorBelt_'$i'/g' {} \;
	
	find ./behaviorFiles -type f -exec sed -i -e 's/(name '1')/(name '$i')/g' {} \;

	cd ..
	 
done




	

