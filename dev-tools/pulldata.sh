#!/bin/bash
# Generator Script for Phishing Links URL Testing Database
# REPO: https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses
# Copyright Mitchell Krog - mitchellkrog@gmail.com

# *******************************
# Input and Output File Variables
# *******************************

inputA=${TRAVIS_BUILD_DIR}/input-source/ALL-feeds-URLS.lst
tmp=${TRAVIS_BUILD_DIR}/input-source/tmp.list

# **********************************************
# Fetch our feed(s) and append to our input file
# **********************************************

FetchData () {
	sudo wget -q https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/input-source/ALL-feeds-URLS.lst -O ${inputA}
}

FetchData

# **********************
# Exit With Error Number
# **********************

exit ${?}
