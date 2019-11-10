<img src="https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/phishing-logo.jpg" alt="Phishing Links & Domains Status Testing Repo"/>

# Phishing Links Testing Database  

_______________
#### Version: V1.0.11374
| Phishing Links Status  | Link Count | Percentage | Last Tested | Download |
| ---: | :---: | :---: | :---: |:---: |
| ACTIVE <img src=https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/green.jpg/> | [40124](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-ACTIVE.txt)  | 43 % | 2019-11-10 at 21:35:47 | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-ACTIVE.txt) |
| INACTIVE <img src=https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/red.jpg/>  | [51796](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INACTIVE.txt)  | 56 % | 2019-11-10 at 21:35:47 | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INACTIVE.txt) |
| INVALID <img src=https://github.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/blob/master/dev-tools/blue.jpg/> | [1275](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INVALID.txt)  | 1 % | 2019-11-10 at 21:35:47 | [Download](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/phishing-links-INVALID.txt) |
*****************************
#### Total Phishing Links Captured: [279331](https://raw.githubusercontent.com/mitchellkrogza/Phishing-URL-Testing-Database-of-Link-Statuses/master/input-source/ALL-feeds-URLS.lst)
____________________


## Purpose of this repo?

An Open Source Threat Intelligence testing repository to test the statuses of ACTIVE Phishing Links on the Internet. Data is collected and collated from multiple open sources and we test if these phishing links are still in an Active, Inactive or Invalid state. 

This repository is part of the [Phishing Domain Database](https://github.com/mitchellkrogza/Phishing.Database). This is just one of a number of extensive projects dealing with testing the status of harmful phishing sites. We test sources of Phishing attacks to keep track of how many of the links used in Phishing attacks are still active and functioning. We sort all domains from all sources into one list, removing any duplicates so that we have a clean list of links to work with.

************************************************
## Define an Active Status

We define ACTIVE domains or links as any of the HTTP Status Codes Below. 
All the following HTTP status codes we regard as ACTIVE or still POTENTIALLY ACTIVE.

- ACTIVE HTTP Codes
```
- 100
- 101
- 200
- 201
- 202
- 203
- 204
- 205
- 206
```
- POTENTIALLY ACTIVE HTTP Codes
```
- 000
- 300
- 301
- 302
- 303
- 304
- 305
- 307
- 403
- 405
- 406
- 407
- 408
- 411
- 413
- 417
- 500
- 501
- 502
- 503
- 504
- 505
```
- POTENTIALLY INACTIVE HTTP Codes
```
- 400
- 402
- 403
- 404
- 409
- 410
- 412
- 414
- 415
- 416
```

For example a 404 not found can simply means the original phishing link is possibly removed and just replaced with a new one we have yet to discover and test. Hence a 404 "Not Found" does not mean the criminal activity on the domain we test is over. 

Even a 403 "Forbidden" message simply means at the time of testing, the site hosting the link we tested returned a Forbidden message which does not mean the link or domain is in any way yet safe. 

Criminals planting Phishing links often resort to a variety of techniques like returning a variety of HTTP failure codes to trick people into thinking the link is gone but in reality if you test a bit later it is often back. 

Our System also tests and re-tests anything flagged as INACTIVE or INVALID.


************************************************
## How do you test?

We make use of the awesome [PyFunceble Testing Suite](https://github.com/funilrys/PyFunceble) written by [Nissar Chababy](https://github.com/funilrys/). Over a year in development this testing tool really provides us with a reliable source of active and inactive domains and through regular testing even domains which are inactive and may become active again are automatically moved back to the active list. [Read More about PyFunceble](https://pyfunceble.readthedocs.io/en/latest/)

************************************************
## Contributing

If you have a source list of phishing domains or links please consider contributing them to this project for testing? 
Simply send a PR adding your input source details and we will add the source. 

************************************************
## Keep Threat Intelligence Free and Open Source

We are firm believers that threat intelligence on Phishing, Malware and Ransomware should always remain free and open source. Open disclosure of any criminal activity such as Phishing, Malware and Ransomware is not only vital to the protection of every internet user and corporation but also vital to the gathering of intelligence in order to shut down these criminal sites. Selling access to phishing data under the guises of "protection" is somewhat questionable. 


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


