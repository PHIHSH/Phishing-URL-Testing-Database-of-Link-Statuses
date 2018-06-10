#!/bin/bash
# Generator Script for Phishing.Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# *******************************
# Input and Output File Variables
# *******************************

inputA=${TRAVIS_BUILD_DIR}/input-source/ALL-feeds.list
output=${TRAVIS_BUILD_DIR}/dev-tools/phishing-domains-ALL.list
output2=${TRAVIS_BUILD_DIR}/dev-tools/phishing-domains-IDNA.list

# **************
# Temp Variables
# **************

outputtmp=${TRAVIS_BUILD_DIR}/phishing.tmp
feed1=${TRAVIS_BUILD_DIR}/input-source/openphish.list
feed2=${TRAVIS_BUILD_DIR}/input-source/phishtank.list
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
    git checkout master
}

# **********************************************
# Fetch our feed(s) and append to our input file
# **********************************************

fetch () {
    sudo wget https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/input-source/ALL-feeds.list -O ${inputA}
}

# *************************************************
# Prepare our input lists and remove any duplicates
# *************************************************

initiate () {

    # Prepare Feed 1 / OpenPhish
    sort -u ${inputA} -o ${inputA}
    grep '[^[:blank:]]' < ${inputA} > ${tmp}
    sudo mv ${tmp} ${inputA}
}

# ***************************************
# Prepare our list for PyFunceble Testing
# ***************************************

prepare () {
    sudo truncate -s 0 ${output}
    sudo cp ${input1} ${output}
    cat ${input2} >> ${output}
    cat ${input3} >> ${output}
    sudo cp ${output} ${inputA}
    cut -d'/' -f3 ${output} > ${outputtmp}
    sort -u ${outputtmp} -o ${outputtmp}
    grep '[^[:blank:]]' < ${outputtmp} > ${output}
    sudo rm ${outputtmp}
    dos2unix ${output}
    sort -u ${inputA} -o ${inputA}
    dos2unix ${inputA}
}


# *********************************
# Prepare our list into IDNA format
# *********************************

idna () {
    domain2idna -f ${output} -o ${output2}
    sort -u ${output2} -o ${output2}
    tr '[:upper:]' '[:lower:]' < ${output2} > ${tmp}
    sudo mv ${tmp} ${output2}
    dos2unix ${output2}
}

PrepareTravis
fetch
initiate
#prepare
#idna


# **********************
# Exit With Error Number
# **********************

exit ${?}
