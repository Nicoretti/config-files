export WIND_HOME=/opt/WindRiver
export WIND_DIAB_PATH=/opt/WindRiver/diab/5.8.0.0.4
export WRSD_LICENSE_FILE=/opt/WindRiver/diab
export WIND_PREFERRED_PACKAGES=diab-5.8.0.0
export PATH=/opt/WindRiver/diab/5.8.0.0.4/LINUX386/bin:$PATH

# Try to get the value of an alias,
# otherwise return the input.
#
# Arguments:
#    1. version - 5.8.0.0.4 or 5.9.3.2 
function set_diab() {
    export WIND_DIAB_PATH=/opt/WindRiver/diab/$1
    export WIND_PREFERRED_PACKAGES=diab-$1
    export PATH=/opt/WindRiver/diab/$1/LINUX386/bin:$PATH
}
