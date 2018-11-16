-- This is the main bootstrap file for the garage door sensor receiver project.
-- file: init.lua
-- created 11/04/2018 barryc

-- We are going to assume that the WiFi settings have already been set, saved,
-- and are still valid. 

-- bring in our module files
require("leds")
require("mymqtt")

-- Declare additional functions
function doorOpen()
	setGreen(0)
	setRed(1)
end

function doorClosed()
	setGreen(1)
	setRed(0)
end

function onMessage(client, topic, message)
	print("TOPIC:", topic, "Message:", message)
	if (message == "ON") then
		doorOpen()
	else
		doorClosed()
	end
end

------------------------------------------------------------------------------
-- Declare details of the server and the topic we want to connect to
------------------------------------------------------------------------------
mqttServer = "192.168.1.30"
mqttUser = ""
mqttPassword = ""
mqttTopic = "openhab/GarageDoor_BinarySensor/state"

------------------------------------------------------------------------------
-- Define LED Pin IDs
------------------------------------------------------------------------------
pinLEDCommon = 6
pinLEDRed = 5
pinLEDGreen = 7

------------------------------------------------------------------------------
-- call initialization and run.
------------------------------------------------------------------------------
leds_enable()
m = mqtt.Client("GarageIndicator", 120)
m:on("message", onMessage)
do_mqtt_connect()
