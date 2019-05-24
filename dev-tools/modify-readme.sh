#!/bin/bash
# Modify README.md Script for Phishing.Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# *****************
# Declare Variables
# *****************

tmprdme=tmprdme
tmprdme2=tmprdme2
version=V1.0.${TRAVIS_BUILD_NUMBER}
versiondate="$(date)"
testdate=$(date +%F)
testtime=$(date +%T)
startmarker="_______________"
endmarker="____________________"
totalexploits=$(wc -l < ${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst)
activesites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-links-ACTIVE.txt)
inactivesites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-links-INACTIVE.txt)
invalidsites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-links-INVALID.txt)
#activesitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-ACTIVE-in-testing.txt)
#inactivesitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INACTIVE-in-testing.txt)
#invalidsitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INVALID-in-testing.txt)
total=$((${activesites} + ${inactivesites} + ${invalidsites}))
#total2=$((${activesitestest} + ${inactivesitestest} + ${invalidsitestest}))
percentactive=$(awk "BEGIN { pc=100*${activesites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinactive=$(awk "BEGIN { pc=100*${inactivesites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinvalid=$(awk "BEGIN { pc=100*${invalidsites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
#percentactivetest=$(awk "BEGIN { pc=100*${activesitestest}/${total2}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
#percentinactivetest=$(awk "BEGIN { pc=100*${inactivesitestest}/${total2}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
#percentinvalidtest=$(awk "BEGIN { pc=100*${invalidsitestest}/${total2}; i=int(pc); print (pc-i<0.5)?i:i+1 }")

# **************************************************
# Write Version and Exploit Count into the README.md
# **************************************************

updatereadme () {

printf '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s%s\n%s' "${startmarker}" "#### Version: ${version}" "| Phishing Links Status  | Link Count | Percentage | Last Tested | Download |" "| ---: | :---: | :---: | :---: |:---: |" "| ACTIVE <img src="https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/green.jpg"/> | [${activesites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-ACTIVE.txt)  | ${percentactive} % | ${testdate} at ${testtime} | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-ACTIVE.txt) |" "| INACTIVE <img src="https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/red.jpg"/>  | [${inactivesites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INACTIVE.txt)  | ${percentinactive} % | ${testdate} at ${testtime} | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INACTIVE.txt) |" "| INVALID <img src="https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/blue.jpg"/> | [${invalidsites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INVALID.txt)  | ${percentinvalid} % | ${testdate} at ${testtime} | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INVALID.txt) |" "*****************************" "#### Total Phishing Links Captured: " "[${totalexploits}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/input-source/ALL-feeds-URLS.lst)" "${endmarker}" >> ${tmprdme}
mv ${tmprdme} ${tmprdme2}
ed -s ${tmprdme2}<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/README.md
/_______________/x
.t.
.,/____________________/-d
w /home/travis/build/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/README.md
q
IN
rm ${tmprdme2}
}

updatereadme

exit ${?}
