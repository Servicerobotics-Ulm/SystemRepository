#!/bin/bash
#
# Start-Stop-Hooks for system SystemWebotsRobotinoSlavePathNav
#
# This script provides methods to call custom commands pre/post of
# starting/stoping the entire system. Environment variables can be
# set in this script which will be visible in all components.
# This script is sourced on the target device where this 
# system is launched.
#

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
# This file is generated once. Modify this file to your needs. 
# If you want the toolchain to re-generate this file, please 
# delete it before running the code generator.
#--------------------------------------------------------------------------

case "$SCRIPT_ARG1" in

pre-start)
	# this section is executed before any componets of the system are started
	# you can also export system-specific environment variables here which will be visible by all components
	echo "Triggering system pre-start hooks ..."
;;

post-start)
	# this section is executed after all components of the system have been started
	echo "Triggering system post-start hooks ..."
;;

pre-stop)
	# this section is executed just before the components of the system are stopped
	echo "Triggering system pre-stop hooks ..."
;;

post-stop)
	# this section is executed after all components of the system have been stopped
	echo "Triggering system post-stop hooks ..."
;;

*)
	echo "ERROR in $0: no such hook '$SCRIPT_ARG1'. Usage: $0 pre-start|post-start|pre-stop|post-stop"
;;

esac
