# Collection of functions that can be used for
# GPIO access
#
# All functions are idempotent - i.e. if the
# GPIO is already in the desired state, nothing
# is done.

function GPIO_init {
    local PIN=$1
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    if test ! -d ${GPIO_DIR}; then
	echo ${PIN} > /sys/class/gpio/export
    fi
}

# Init GPIO and set to output
function GPIO_set_output {
    local PIN=$1
    local GPIO_DIR=/sys/class/gpio/gpio${PIN}

    CURRENT_DIRECTION=$(cat ${GPIO_DIR}/direction)

    if test ! "${CURRENT_DIRECTION}" = "out"; then
	echo "out" > ${GPIO_DIR}/direction
    fi
}

function GPIO_cleanup {
    local PIN=$1
    echo ${PIN} > /sys/class/gpio/unexport
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

#trap "GPIO_cleanup 17" EXIT

#GPIO_set_output ${GPIO_PIN}

#for (( i = 0; i < 10000; i += 1 )) ; do
#while true; do
#    echo "Set to HIGH"
#    GPIO_set_high ${GPIO_PIN}
#    sleep 0.02
#    echo "Set to LOW"
#    GPIO_set_low ${GPIO_PIN}
#    sleep 0.02
#done

