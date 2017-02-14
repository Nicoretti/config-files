export WIND_HOME=/opt/WindRiver
export WIND_DIAB_PATH=/opt/WindRiver/diab/5.8.0.0.4
export WRSD_LICENSE_FILE=/opt/WindRiver/diab
export WIND_PREFERRED_PACKAGES=diab-5.8.0.0
export PATH=/opt/WindRiver/diab/5.8.0.0.4/LINUX386/bin:$PATH

function set_diab() {
    export WIND_DIAB_PATH=/opt/WindRiver/diab/$1
    export WIND_PREFERRED_PACKAGES=diab-$1
    export PATH=/opt/WindRiver/diab/$1/LINUX386/bin:$PATH
}

