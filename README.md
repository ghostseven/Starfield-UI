# Starfield-UI
Rainmeter Starfield UI 

This configuration and detials page is very basic and some work will be required.  You can message here or on reddit I am ghostseven.

## Release Link
https://github.com/ghostseven/Starfield-UI/release

## A Word About Fonts

The Starfield font is NB Architekt Regular, this is a commercial font and cannot be included in this package. An alternative is provided in this package. If you wish to use the commercial font it can be purchased from https://neubauladen.com/product/nb-architekt-edition/

![A comparison of the substituted font](https://github.com/ghostseven/Starfield-UI/blob/master/Font-Comparison.png)



## Requirements

1. A basic familiarity with Rainmeter.
2. Your own API key from https://www.weatherapi.com/, you will need to sign up and get yourself a free API key.
3. Get your location in Long / Lat from https://www.latlong.net/
4. Be comfortable doing basic editing of text files (need to make changes to Variables.inc at the minimum).

## Installation

1. Install by clicking the package after first having installed Rainmeter

## Configuration 

1. Edit the Variable.inc file found in the skin folder under @Resources
2. Change WeatherAPI=[YOURKEY] after the = to your API, this is obtained by signing up to https://www.weatherapi.com/
3. Change LONG=XX.XX and LAT=XX.XX after the = to your location, this is obtained by using https://www.latlong.net/
4. Change or comment out (remove the leading ; from what you need and add a leading ; for the lines you do not) TempQuery=current.temp_c and DegText="C" depending on if you wish temp to be in F or C.
5. Reload any loaded Starfield UI rainmeter components.

## Application Launcher

1. The squares under Resources are application launchers, you can change what is launched and what the text displays by editing the Apps & Paths section in the Variable.inc file found in the skin folder under @Resources

## Game Quotes

The top text shown under the constellation logo can periodically change to any short text you wish.  It currently has one entry so never changes, should you wish to add more quotes open starfield.txt found under @Resources/Text and add each quote on a new line.

## Scaling 

1. If you mouse over most loaded components you can (if drag is enabled) scale them using your mouse wheel.

