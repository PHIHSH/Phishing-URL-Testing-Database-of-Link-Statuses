#!/bin/bash
# Incremental Commit for Phishing Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# **************
# File Variables
# **************

    FullList=${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst


RunPartialCommit () {
# ****************************************
# Copy last tested files into root of repo
# ****************************************


statuses="ACTIVE INACTIVE INVALID"

for status in $(echo ${statuses})
do
    statusFile="${TRAVIS_BUILD_DIR}/dev-tools/output/domains/${status}/list"

    if [[ -f ${statusFile} ]]
    then
        cat ${statusFile} | grep -v "^$" | grep -v "^#" > ${TRAVIS_BUILD_DIR}/phishing-urls-${status}-in-testing.txt
    else
        echo "" > ${TRAVIS_BUILD_DIR}/phishing-urls-${status}-in-testing.txt
    fi
done

# *********************************************************
# Modify Readme File
# *********************************************************

bash ${TRAVIS_BUILD_DIR}/dev-tools/modify-readme.sh

}

RunPartialCommit

# **********************
# Exit With Error Number
# **********************

exit ${?}
