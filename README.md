# Battery health checker

##### Disclaimer: I haven't checked the compatibility of this script on anything besides my main laptop, a Dell Inspiron 15 5100 running Arch, on Alacritty. I see no reason it wouldn't work on anything else, but it is untested 

![img](https://user-images.githubusercontent.com/68666531/147891824-5c7b9f0c-22aa-42fa-b8ae-5648e20fac73.png)

A simple Ruby script that fetches your battery health from UPower and prints it in a readable way. 
It defaults to fetching the health for BAT0, but if supplied with the flag -a it will give 
you a selection menu of all your power devices. It can also be supplied
with a number to debug different battery health levels. These two argumenets
are not compatible.

It prints some little 2012 style messages by default, these can be changed super easily. 

*Obviously requires Ruby and UPower*

**To either run this script quickly or sample its output, feel free to run:**

`curl -s https://raw.githubusercontent.com/jemhop/bathealth/main/bathealth.rb | ruby`


