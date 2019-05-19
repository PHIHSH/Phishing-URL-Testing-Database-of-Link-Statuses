#!/bin/bash
# Generator Script for Phishing.Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# *******************************
# Input and Output File Variables
# *******************************

inputA=${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst
tmp=${TRAVIS_BUILD_DIR}/input-source/tmp.list

# *********************************************
# Get Travis CI Prepared for Committing to Repo
# *********************************************

PrepareTravis () {
    git remote rm origin
    git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
    git config --global user.email "${GIT_EMAIL}"
    git config --global user.name "${GIT_NAME}"
    git config --global push.default simple
    git checkout "${GIT_BRANCH}"
}

# **********************************************
# Fetch our feed(s) and append to our input file
# **********************************************

fetch () {
	sudo wget -q https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/input-source/ALL-feeds-URLS.lst -O ${inputA}
}

# *************************************************
# Prepare our input lists and remove any duplicates
# *************************************************

initiate () {

    # Prepare Feed
    cat ${inputA} | sed 's/^[ \t]*//;s/[ \t]*$//' > ${tmp}
    sudo mv ${tmp} ${inputA}
}


PrepareTravis
fetch
initiate

# **********************
# Exit With Error Number
# **********************

exit ${?}
