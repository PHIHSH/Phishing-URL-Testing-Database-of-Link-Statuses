#!/bin/bash
# Incremental Commit for Phishing Links URL Testing Database
# REPO: https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses
# Copyright Mitchell Krog - mitchellkrog@gmail.com


UpdateFiles () {
# ****************************************
# Copy last tested files into root of repo
# ****************************************

statuses="ACTIVE INACTIVE INVALID"

for status in $(echo ${statuses})
do
    statusFile="${TRAVIS_BUILD_DIR}/dev-tools/output/domains/${status}/list"

    if [[ -f ${statusFile} ]]
    then
        cat ${statusFile} | grep -v "^$" | grep -v "^#" > ${TRAVIS_BUILD_DIR}/phishing-links-${status}.txt
    else
        echo "" > ${TRAVIS_BUILD_DIR}/phishing-links-${status}.txt
    fi
done

# *********************************************************
# Clean with whitelist
# *********************************************************

#bash ${TRAVIS_BUILD_DIR}/dev-tools/whitelist.sh

# *********************************************************
# Modify Readme File
# *********************************************************

bash ${TRAVIS_BUILD_DIR}/dev-tools/modify-readme.sh

}

UpdateFiles

CommitData () {
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
cd ${TRAVIS_BUILD_DIR}
git remote rm origin
git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git config --global push.default simple
git checkout master
git add -A
git commit -am "V1.0.${TRAVIS_BUILD_NUMBER} [ci skip]"
git push origin master    
}
CommitData

# **********************
# Exit With Error Number
# **********************

exit ${?}
