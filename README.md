<img src="https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/phishing-logo.jpg" alt="Phishing Links & Domains Status Testing Repo"/>

# Phishing Links Testing Database  

_______________
#### Version: V1.0.11188
#### ACTIVE Phishing URLs (Tested): [0](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-ACTIVE.txt) ( %)
#### INACTIVE Phishing URLs (Tested): [0](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INACTIVE.txt) ( %)
#### INVALID Phishing URLs (Tested): [0](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INVALID.txt) ( %)
*****************************
#### ACTIVE Phishing URLs (In Testing): [13548](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-ACTIVE-in-testing.txt) (42 %)
#### INACTIVE Phishing URLs (In Testing): [18140](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INACTIVE-in-testing.txt) (57 %)
#### INVALID Phishing URLs (In Testing): [388](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-urls-INVALID-in-testing.txt) (1 %)
*****************************
#### Total Phishing URL's Captured: [86878](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/input-source/ALL-feeds-URLS.lst)
____________________


## Purpose of this repo?

A testing repository to test the statuses of Phishing Links on the Internet. Data is collected and collated from multiple sources and we test if these phishing links are still in an Active, Inactive or Invalid state. This repository is part of the [Phishing Domain Database](https://github.com/mitchellkrogza/Phishing.Database). This is just one of a number of extensive projects dealing with testing the status of harmful phishing sites. We test sources of Phishing attacks to keep track of how many of the links used in Phishing attacks are still active and functioning. We sort all domains from all sources into one list, removing any duplicates so that we have a clean list of links to work with.

************************************************
## How do you test?

We make use of the awesome [PyFunceble Testing Suite](https://github.com/funilrys/PyFunceble) written by [Nissar Chababy](https://github.com/funilrys/). Over a year in development this testing tool really provides us with a reliable source of active and inactive domains and through regular testing even domains which are inactive and may become active again are automatically moved back to the active list.

************************************************
## Contributing

If you have a source list of phishing domains why not contribute them to this project for testing? Simply send a PR adding your input source details and we will add the source. 


************************************************
## Contributors

- [Mitchell Krog](https://github.com/mitchellkrogza/)
- [Nissar Chababy](https://github.com/funilrys/)

************************************************
MIT License

Copyright (c) 2018 Mitchell Krog
https://github.com/mitchellkrogza

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
