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

    cd ${TRAVIS_BUILD_DIR}/dev-tools

    hash PyFunceble

    if [[ -f "${pyfuncebleConfigurationFileLocation}" ]]
    then
        rm "${pyfuncebleConfigurationFileLocation}"
        rm "${pyfuncebleProductionConfigurationFileLocation}"
    fi

    PyFunceble --travis -dbr 5 -ex --multiprocess --processes 10 --dns 1.1.1.1 1.0.0.1 --plain --cmd "bash ${TRAVIS_BUILD_DIR}/dev-tools/incremental-commit.sh" --cmd-before-end "bash ${TRAVIS_BUILD_DIR}/dev-tools/commit.sh" --autosave-minutes 10 --commit-autosave-message "V1.0.${TRAVIS_BUILD_NUMBER} [PyFunceble]" --commit-results-message "V1.0.${TRAVIS_BUILD_NUMBER}" --url-file ${input}

}
RunFunceble


# DEBUGGING COMMITS - Just Disable RunFunceble Function and Enable DebugCommit function
DebugCommit () {
    bash ${TRAVIS_BUILD_DIR}/dev-tools/modify-readme.sh
    bash ${TRAVIS_BUILD_DIR}/dev-tools/debug-commit.sh
}

#DebugCommit

# **********************
# Exit With Error Number
# **********************

exit ${?}
