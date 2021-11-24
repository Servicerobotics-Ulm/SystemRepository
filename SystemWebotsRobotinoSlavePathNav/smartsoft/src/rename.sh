#!/bin/bash

find ./ -type f -exec sed -i -e 's/SmartCdlServer_'$1'/SmartCdlServer_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentTCLSequencer_'$1'/ComponentTCLSequencer_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentWebotsMobileRobot_'$1'/ComponentWebotsMobileRobot_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentRobotToRobotDocking_'$1'/ComponentRobotToRobotDocking_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentSeq2SeqCom_'$1'/ComponentSeq2SeqCom_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentWebotsConveyorBeltOpcua_'$1'/ComponentWebotsConveyorBeltOpcua_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentWebotsMpsDocking_'$1'/ComponentWebotsMpsDocking_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/SmartAmcl_'$1'/SmartAmcl_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentKB_'$1'/ComponentKB_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/SmartMapperGridMap_'$1'/SmartMapperGridMap_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentWebots2DLidar_'$1'/ComponentWebots2DLidar_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/SmartPlannerBreadthFirstSearch_'$1'/SmartPlannerBreadthFirstSearch_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/ComponentGoalNodeControl_'$1'/ComponentGoalNodeControl_'$2'/g' {} \;

find ./behaviorFiles -type f -exec sed -i -e 's/SystemWebotsRobotinoSlavePathNav_'$1'/SystemWebotsRobotinoSlavePathNav_'$2'/g' {} \;

mv SmartCdlServer_$1_data SmartCdlServer_$2_data
mv SmartCdlServer_$1.ini SmartCdlServer_$2.ini

mv ComponentTCLSequencer_$1_data ComponentTCLSequencer_$2_data
mv ComponentTCLSequencer_$1.ini ComponentTCLSequencer_$2.ini

mv ComponentWebotsMobileRobot_$1_data ComponentWebotsMobileRobot_$2_data
mv ComponentWebotsMobileRobot_$1.ini ComponentWebotsMobileRobot_$2.ini

mv ComponentRobotToRobotDocking_$1_data ComponentRobotToRobotDocking_$2_data  
mv ComponentRobotToRobotDocking_$1.ini ComponentRobotToRobotDocking_$2.ini 

mv ComponentSeq2SeqCom_$1_data ComponentSeq2SeqCom_$2_data
mv ComponentSeq2SeqCom_$1.ini ComponentSeq2SeqCom_$2.ini
  
mv ComponentWebotsConveyorBeltOpcua_$1_data ComponentWebotsConveyorBeltOpcua_$2_data
mv ComponentWebotsConveyorBeltOpcua_$1.ini ComponentWebotsConveyorBeltOpcua_$2.ini
  
mv ComponentWebotsMpsDocking_$1_data ComponentWebotsMpsDocking_$2_data  
mv ComponentWebotsMpsDocking_$1.ini ComponentWebotsMpsDocking_$2.ini

mv SmartAmcl_$1_data SmartAmcl_$2_data  
mv SmartAmcl_$1.ini SmartAmcl_$2.ini 

mv ComponentKB_$1_data ComponentKB_$2_data    
mv ComponentKB_$1.ini ComponentKB_$2.ini
  
mv SmartMapperGridMap_$1_data SmartMapperGridMap_$2_data
mv SmartMapperGridMap_$1.ini SmartMapperGridMap_$2.ini 
  
mv ComponentWebots2DLidar_$1_data ComponentWebots2DLidar_$2_data  
mv ComponentWebots2DLidar_$1.ini ComponentWebots2DLidar_$2.ini 

mv SmartPlannerBreadthFirstSearch_$1_data SmartPlannerBreadthFirstSearch_$2_data  
mv SmartPlannerBreadthFirstSearch_$1.ini SmartPlannerBreadthFirstSearch_$2.ini

mv ComponentGoalNodeControl_$1_data ComponentGoalNodeControl_$2_data
mv ComponentGoalNodeControl_$1.ini ComponentGoalNodeControl_$2.ini

find ./ -type f -exec sed -i -e 's/Robotino3_'$1'/Robotino3_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/Lidar_'$1'/Lidar_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/MpsDocking_'$1'/MpsDocking_'$2'/g' {} \;
find ./ -type f -exec sed -i -e 's/RobotinoConveyorBelt_'$1'/RobotinoConveyorBelt_'$2'/g' {} \;

find ./behaviorFiles -type f -exec sed -i -e 's/(name '$1')/(name '$2')/g' {} \;
