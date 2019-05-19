#!/bin/bash
# Modify README.md Script for Phishing.Database
# REPO: https://github.com/mitchellkrogza/Phishing.Database
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# *****************
# Declare Variables
# *****************

tmprdme=tmprdme
tmprdme2=tmprdme2
version=V0.1.${TRAVIS_BUILD_NUMBER}
versiondate="$(date)"
startmarker="_______________"
endmarker="____________________"
totalexploits=$(wc -l < ${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst)
activesites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-ACTIVE.txt)
inactivesites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INACTIVE.txt)
invalidsites=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INVALID.txt)
activesitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-ACTIVE-in-testing.txt)
inactivesitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INACTIVE-in-testing.txt)
invalidsitestest=$(wc -l < ${TRAVIS_BUILD_DIR}/phishing-urls-INVALID-in-testing.txt)
total=$((${activesites} + ${inactivesites} + ${invalidsites}))
percentactive=$(awk "BEGIN { pc=100*${activesites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinactive=$(awk "BEGIN { pc=100*${inactivesites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinvalid=$(awk "BEGIN { pc=100*${invalidsites}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentactivetest=$(awk "BEGIN { pc=100*${activesitestest}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinactivetest=$(awk "BEGIN { pc=100*${inactivesitestest}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
percentinvalidtest=$(awk "BEGIN { pc=100*${invalidsitestest}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")

# **************************************************
# Write Version and Exploit Count into the README.md
# **************************************************

updatereadme () {

printf '%s\n%s%s\n%s%s\n%s%s\n%s%s\n%s\n%s%s\n%s%s\n%s%s\n%s\n%s%s\n%s' "${startmarker}" "#### Version: " "${version}" "#### ACTIVE Phishing URLs (Tested): " "[${activesites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-ACTIVE.txt) (${percentactive} %)" "#### INACTIVE Phishing URLs (Tested): " "[${inactivesites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INACTIVE.txt) (${percentinactive} %)" "#### INVALID Phishing URLs (Tested): " "[${invalidsites}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INVALID.txt) (${percentinvalid} %)" "*****************************" "#### ACTIVE Phishing URLs (In Testing): " "[${activesitestest}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-ACTIVE-in-testing.txt) (${percentactivetest} %)" "#### INACTIVE Phishing URLs (In Testing): " "[${inactivesitestest}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INACTIVE-in-testing.txt) (${percentinactivetest} %)" "#### INVALID Phishing URLs (In Testing): " "[${invalidsitestest}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INVALID-in-testing.txt) (${percentinvalidtest} %)" "*****************************" "#### Total Phishing URL's Captured: " "[${totalexploits}](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/input-source/ALL-feeds-URLS.lst)" "${endmarker}" >> ${tmprdme}
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
