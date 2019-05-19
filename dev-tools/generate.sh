#!/bin/bash
# Generator Script for Phishing.Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

input=${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst
pyfuncebleConfigurationFileLocation=${TRAVIS_BUILD_DIR}/dev-tools/.PyFunceble.yaml
pyfuncebleProductionConfigurationFileLocation=${TRAVIS_BUILD_DIR}/dev-tools/.PyFunceble_production.yaml


# **********************
# Run PyFunceble Testing
# **********************************************************
# Find PyFunceble at: https://github.com/funilrys/PyFunceble
# **********************************************************

RunFunceble () {

    yeartag=$(date +%Y)
    monthtag=$(date +%m)
    #sudo chown -R travis:travis ${TRAVIS_BUILD_DIR}/

    cd ${TRAVIS_BUILD_DIR}/dev-tools

    hash PyFunceble

    if [[ -f "${pyfuncebleConfigurationFileLocation}" ]]
    then
        rm "${pyfuncebleConfigurationFileLocation}"
        rm "${pyfuncebleProductionConfigurationFileLocation}"
    fi

    PyFunceble --travis -dbr 5 --multiprocess --processes 60 --dns 1.1.1.1 1.0.0.1 --quiet -ex --plain --cmd-before-end "bash ${TRAVIS_BUILD_DIR}/dev-tools/commit.sh" --autosave-minutes 10 --commit-autosave-message "V0.1.${TRAVIS_BUILD_NUMBER} [PyFunceble]" --commit-results-message "V0.1.${TRAVIS_BUILD_NUMBER}" --url-file ${input}

}

RunFunceble

# **********************
# Exit With Error Number
# **********************

exit ${?}
