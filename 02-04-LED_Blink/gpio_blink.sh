#!/bin/bash
#
# Switches the given GPIO (e.g. LED) on or off
#
# (C) 2017 Andreas Florath <andreas@florath.net>
# See COPYING for license.
#

set -e

GPIO_PIN=""
TIME_LOW=1.0
TIME_HIGH=1.0
DEBUG=0

if test -z "${BASH_LIB_DIR}"; then
    echo "The environment variable BASH_LIB_DIR must be set to the bash library"
    exit 1
fi

while getopts "g:l:h:d" opt; do
    case $opt in
	g)
	    GPIO_PIN=${OPTARG}
	    ;;
	l)
	    TIME_LOW=${OPTARG}
	    ;;
	h)
	    TIME_HIGH=${OPTARG}
	    ;;
	d)
	    DEBUG=1
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    exit 1
	    ;;
    esac
done

function usage {
    echo "gpio_blink.sh -g GPIO_NUM -0 TIME -1 TIME"
    echo "-0 / -1 are optional; default: 1.0 sec"
}

if test -z "${GPIO_PIN}"; then
    usage
    echo "Error: -g not specified"
    exit 1
fi

. ${BASH_LIB_DIR}/GPIO.sh

GPIO_init ${GPIO_PIN}
trap "GPIO_cleanup 17" EXIT
GPIO_set_output ${GPIO_PIN}

while true; do
    test ${DEBUG} -eq 1 && echo "Set to HIGH"
    GPIO_set_high ${GPIO_PIN}
    sleep ${TIME_HIGH}
    test ${DEBUG} -eq 1 && echo "Set to LOW"
    GPIO_set_low ${GPIO_PIN}
    sleep ${TIME_LOW}
done

