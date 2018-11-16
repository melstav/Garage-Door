# Garage-Door
This repo contains the bits of a project to implement a garage door monitor that could be monitored not just through the web interface of a smarthome hub, but by looking at the state of a red/green LED.

A discussion on why I made this thing, what hardware I used, and decisions made along the way can be found at http://melstav.lakotacreations.com/garage-door-monitor/ There's also a list of things that I intend to add when I get around to it.

The openhab directory contains my notes from setting up openhab to interface with both the sensor and the MQTT server, and the config files that I had to edit by hand.

The display directory contains the Lua code I wrote / cobbled together to drive the physical monitor/display.
