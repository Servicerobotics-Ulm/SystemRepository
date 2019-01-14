#!/bin/bash
#--------------------------------------------------------------------------
# Code generated by the SmartSoft MDSD Toolchain
# The SmartSoft Toolchain has been developed by:
#  
# Service Robotics Research Center
# University of Applied Sciences Ulm
# Prittwitzstr. 10
# 89075 Ulm (Germany)
#
# Information about the SmartSoft MDSD Toolchain is available at:
# www.servicerobotik-ulm.de
#
# Please do not modify this file. It will be re-generated
# running the code generator.
#--------------------------------------------------------------------------
#
# run this script from the component's root folder to deploy the scenario to device.
#

TARGET_SSHUSER=student
TARGET_IP=c26-11-robota
TARGET_DIRECTORY="/tmp"
DEPLOYMENT_DIRECTORY=SystemP3dxNavigationRealWorld.deployment/

echo "#######################################################"
echo "## Deployment of Device C26_11_RobotA / $TARGET_IP"
echo "#######################################################"
echo "Target SSH user:      $TARGET_SSHUSER"
echo "Target IP:            $TARGET_IP"
echo "Target directory:     $TARGET_DIRECTORY"
echo "Deployment directory: $DEPLOYMENT_DIRECTORY"

echo "Working directory of deployment script: "`pwd`

echo Sourcing referenced projects
source src-gen/deployment/referenced-projects

DEPLOY_LIBRARIES_USER=""
echo "Sourcing pre-deployment script for SmartCdlServer... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartCdlServer.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartCdlServer/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer="$DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer $REFERENCED_PROJECT_SmartCdlServer/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer="$DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer $I"
	fi
done

echo
echo "Sourcing pre-deployment script for SmartLaserLMS200Server... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartLaserLMS200Server.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartLaserLMS200Server/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server="$DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server $REFERENCED_PROJECT_SmartLaserLMS200Server/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server="$DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server $I"
	fi
done

echo
echo "Sourcing pre-deployment script for SmartMapperGridMap... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartMapperGridMap.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartMapperGridMap/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap="$DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap $REFERENCED_PROJECT_SmartMapperGridMap/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap="$DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap $I"
	fi
done

echo
echo "Sourcing pre-deployment script for SmartPioneerBaseServer... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartPioneerBaseServer.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartPioneerBaseServer/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer="$DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer $REFERENCED_PROJECT_SmartPioneerBaseServer/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer="$DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer $I"
	fi
done

echo
echo "Sourcing pre-deployment script for SmartPlannerBreadthFirstSearch... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartPlannerBreadthFirstSearch.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartPlannerBreadthFirstSearch/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch="$DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch $REFERENCED_PROJECT_SmartPlannerBreadthFirstSearch/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch="$DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch $I"
	fi
done

echo
echo "Sourcing pre-deployment script for SmartRobotConsole... (errors might be ignored)"
DEPLOY_LIBRARIES=""
DEPLOY_COMPONENT_FILES=""
source src/predeploy-SmartRobotConsole.sh 2>&1

for I in $DEPLOY_LIBRARIES; do
	if [ -e "$SMART_ROOT_ACE/bin/$I" ]; then
		FILE="$SMART_ROOT_ACE/bin/$I"
	else
		FILE="$SMART_ROOT_ACE/lib/$I"
	fi
	DEPLOY_LIBRARIES_USER="$DEPLOY_LIBRARIES_USER $FILE"
done

DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole=""
for I in $DEPLOY_COMPONENT_FILES; do
	if ls $REFERENCED_PROJECT_SmartRobotConsole/$I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole="$DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole $REFERENCED_PROJECT_SmartRobotConsole/$I"
	elif ls $I > /dev/null 2>&1; then
		DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole="$DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole $I"
	fi
done

echo


DEPL_FILES="
$SMART_ROOT_ACE/lib/libAceSmartSoftKernel.so
$SMART_ROOT_ACE/lib/libSmartProperty.so.*
src-gen/deployment/tiler.sh
src-gen/deployment/start-C26_11_RobotA.sh
$SMART_ROOT_ACE/bin/NamingService
src-gen/deployment/ns_config.ini
src/SmartCdlServer_data
src/startstop-hooks-SmartCdlServer.sh
$SMART_ROOT_ACE/bin/SmartCdlServer
src-gen/deployment/SmartCdlServer.ini
$SMART_ROOT_ACE/lib/libCommNavigationObjects.so*
$SMART_ROOT_ACE/lib/libCommRobotinoObjects.so*
$SMART_ROOT_ACE/lib/libCommTrackingObjects.so*
$SMART_ROOT_ACE/lib/libCommBasicObjects.so*
src/SmartLaserLMS200Server_data
src/startstop-hooks-SmartLaserLMS200Server.sh
$SMART_ROOT_ACE/bin/SmartLaserLMS200Server
src-gen/deployment/SmartLaserLMS200Server.ini
$SMART_ROOT_ACE/lib/libCommBasicObjects.so*
src/SmartMapperGridMap_data
src/startstop-hooks-SmartMapperGridMap.sh
$SMART_ROOT_ACE/bin/SmartMapperGridMap
src-gen/deployment/SmartMapperGridMap.ini
$SMART_ROOT_ACE/lib/libCommNavigationObjects.so*
$SMART_ROOT_ACE/lib/libCommBasicObjects.so*
src/SmartPioneerBaseServer_data
src/startstop-hooks-SmartPioneerBaseServer.sh
$SMART_ROOT_ACE/bin/SmartPioneerBaseServer
src-gen/deployment/SmartPioneerBaseServer.ini
$SMART_ROOT_ACE/lib/libCommBasicObjects.so*
src/SmartPlannerBreadthFirstSearch_data
src/startstop-hooks-SmartPlannerBreadthFirstSearch.sh
$SMART_ROOT_ACE/bin/SmartPlannerBreadthFirstSearch
src-gen/deployment/SmartPlannerBreadthFirstSearch.ini
$SMART_ROOT_ACE/lib/libCommNavigationObjects.so*
$SMART_ROOT_ACE/lib/libCommBasicObjects.so*
src/SmartRobotConsole_data
src/startstop-hooks-SmartRobotConsole.sh
$SMART_ROOT_ACE/bin/SmartRobotConsole
src-gen/deployment/SmartRobotConsole.ini

$DEPLOY_LIBRARIES_USER
"

FILES_MISSING=false
for FILE in $DEPL_FILES; do
	if [ ! -e $FILE ]; then
		echo "Deployment: No such file or directory: $FILE"
		FILES_MISSING=true
	fi
done

if [ "$FILES_MISSING" = "true" ]; then
	echo
	echo "ERROR: FILES ARE MISSING FROM THE DEPLOYMENT (see above). Did you compile all components?"
	echo 
	exit 1
fi


if [ "$1" = "local" ]; then
	# local deployment
	mkdir -p $DEPLOYMENT_DIRECTORY
	rsync -l -r -v --progress --exclude ".svn" $DEPL_FILES $DEPLOYMENT_DIRECTORY/C26_11_RobotA
else
	# remote deployment
	SSH_TARGET=student@c26-11-robota:$TARGET_DIRECTORY/$DEPLOYMENT_DIRECTORY
	echo "Deployment to $SSH_TARGET"
	ssh student@c26-11-robota mkdir -p $TARGET_DIRECTORY/$DEPLOYMENT_DIRECTORY
	
	TMPDIR=$(mktemp -d --suffix=.deployment) || exit 1
	echo "Temporary directory: $TMPDIR"
	trap "rm -rf $TMPDIR" EXIT
	
	# collect files in $TMPDIR
	#rsync -l -r -v --progress --exclude ".svn" $DEPL_FILES $TMPDIR/
	cp -rv $DEPL_FILES $TMPDIR 2>&1
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer $TMPDIR/SmartCdlServer_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartCdlServer $TMPDIR/SmartCdlServer_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartCdlServer/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartCdlServer.sh 2>/dev/null
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server $TMPDIR/SmartLaserLMS200Server_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartLaserLMS200Server $TMPDIR/SmartLaserLMS200Server_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartLaserLMS200Server/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartLaserLMS200Server.sh 2>/dev/null
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap $TMPDIR/SmartMapperGridMap_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartMapperGridMap $TMPDIR/SmartMapperGridMap_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartMapperGridMap/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartMapperGridMap.sh 2>/dev/null
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer $TMPDIR/SmartPioneerBaseServer_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartPioneerBaseServer $TMPDIR/SmartPioneerBaseServer_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartPioneerBaseServer/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartPioneerBaseServer.sh 2>/dev/null
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch $TMPDIR/SmartPlannerBreadthFirstSearch_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartPlannerBreadthFirstSearch $TMPDIR/SmartPlannerBreadthFirstSearch_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartPlannerBreadthFirstSearch/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartPlannerBreadthFirstSearch.sh 2>/dev/null
#rsync -l -r -v --progress --exclude ".svn" $DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole $TMPDIR/SmartRobotConsole_data/
if [ ! "$DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole" = "" ]; then
	cp -rv $DEPLOY_COMPONENT_FILES_PATHS_SmartRobotConsole $TMPDIR/SmartRobotConsole_data/ 2>&1
fi

cp -v $REFERENCED_PROJECT_SmartRobotConsole/smartsoft/src/startstop-hooks.sh $TMPDIR/startstop-hooks-component-SmartRobotConsole.sh 2>/dev/null
	# actually deploy:
	rsync -z -l -r -v --progress --exclude ".svn" -e ssh $TMPDIR/ $SSH_TARGET
fi


if [ "$?" != "0" ]; then
	echo "ERROR: Files could not be deployed to remote host."
	#gdialog --title ERROR --msgbox "Files could not be deployed host."
	exit 1
fi

echo -e "\n\nDeployment to device C26_11_RobotA finished.\n\n"
