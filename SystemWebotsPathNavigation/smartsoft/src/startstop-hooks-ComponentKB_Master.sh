#!/bin/bash
#
# Start-Stop-Hooks for component ComponentKB_Master
#
# This script provides methods to call custom commands pre/post of
# starting/stoping the component during launch on the device.
# This script is being executed on the target device where this 
# component is running.
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

case "$1" in

pre-start)
	# first, trigger hooks as delivered from component ...
	bash startstop-hooks-component-ComponentKB.sh pre-start
	
	# ...then call user/deployment specific hook:
	echo "Triggering pre-start hooks ..."
;;

post-start)
	# first, trigger hooks as delivered from component ...
	bash startstop-hooks-component-ComponentKB.sh post-start
	
	# ...then call user/deployment specific hook:
	echo "Triggering post-start hooks ..."
;;

pre-stop)
	# first, trigger hooks as delivered from component ...
	bash startstop-hooks-component-ComponentKB.sh pre-stop
	
	# ...then call user/deployment specific hook:
	echo "Triggering pre-stop hooks ..."
;;

post-stop)
	# first, trigger hooks as delivered from component ...
	bash startstop-hooks-component-ComponentKB.sh post-stop
	
	# ...then call user/deployment specific hook:
	echo "Triggering post-stop hooks ..."
;;

*)
	echo "ERROR in $0: no such hook '$1'. Usage: $0 pre-start|post-start|pre-stop|post-stop"
;;

esac

