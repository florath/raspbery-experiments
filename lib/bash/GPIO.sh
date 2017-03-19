# Collection of functions that can be used for
# GPIO access
#
# All functions are idempotent - i.e. if the
# GPIO is already in the desired state, nothing
# is done.
#
# (C) 2017 Andreas Florath <andreas@florath.net>
# See COPYING for license.

function GPIO_init {
    local PIN=$1
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    if test ! -d ${GPIO_DIR}; then
	echo ${PIN} > /sys/class/gpio/export
    fi
}

function GPIO_cleanup {
    local PIN=$1
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    if test  -d ${GPIO_DIR}; then
	echo ${PIN} > /sys/class/gpio/unexport
    fi
}

function GPIO_set_output {
    local PIN=$1
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    CURRENT_DIRECTION=$(cat ${GPIO_DIR}/direction)

    if test ! "${CURRENT_DIRECTION}" = "out"; then
	echo "out" > ${GPIO_DIR}/direction
    fi
}

function GPIO_set {
    local PIN=$1
    local VALUE=$2
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    echo ${VALUE} > ${GPIO_DIR}/value
}

function GPIO_set_high {
    local PIN=$1

    GPIO_set ${PIN} 1
}

function GPIO_set_low {
    local PIN=$1

    GPIO_set ${PIN} 0
}
