#!/bin/bash
#
# Switches the given GPIO (e.g. LED) on or off
#
# (C) 2017 Andreas Florath <andreas@florath.net>
# See COPYING for license.
#

set -e

GPIO_PIN=""

if test -z "${BASH_LIB_DIR}"; then
    echo "The environment variable BASH_LIB_DIR must be set to the bash library"
    exit 1
fi

while getopts "g:" opt; do
    case $opt in
	g)
	    GPIO_PIN=${OPTARG}
	    shift 2
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    exit 1
	    ;;
    esac
done

function usage {
    echo "gpio_switch.sh -g GPIO_NUM [on|1|off|0]"
}

if test -z "${GPIO_PIN}"; then
    usage
    echo "Error: -g not specified"
    exit 1
fi

if test $# -ne 1; then
    usage
    echo "Error: no level given"
    exit 1
fi

LEVEL=$1

if test "${LEVEL}" == 'on'; then
    LEVEL=1
elif test "${LEVEL}" == 'off'; then
    LEVEL=0
fi

. ${BASH_LIB_DIR}/GPIO.sh

GPIO_init ${GPIO_PIN}
GPIO_set_output ${GPIO_PIN}
GPIO_set ${GPIO_PIN} ${LEVEL}
