-- This is the main bootstrap file for the garage door sensor receiver project.
-- file: init.lua
-- created 11/04/2018 barryc
-- modified 11/mumble/2018 barryc
-- 	add event handlers for connecting/disconnecting from wifi.
-- modified 12/1/2018 barryc
--	add event handler for disconnecting from MQTT server without being 
--	disconnected from wifi.
-- We are going to assume that the WiFi settings have already been set, saved,
-- and are still valid. 

-- bring in our module files
require("leds")
require("mymqtt")
require("mywifi")

-- Declare additional functions
function doorOpen()
	setGreen(0)
	setRed(1)
end

function doorClosed()
	setGreen(1)
	setRed(0)
end

function notConnected()
	setGreen(1)
	setRed(1)
end

function onMessage(client, topic, message)
	print("TOPIC:", topic, "Message:", message)
	if ((message == "ON") or (message == "1")) then
		doorOpen()
	else
		doorClosed()
	end
end

function onMQTTDisconnect(client)
		notConnected()
		do_mqtt_connect()
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
-- Set up our MQTT client and tie in the message and offline callbacks
------------------------------------------------------------------------------
m = mqtt.Client("GarageIndicator", 120)
m:on("message", onMessage)
m:on("offline", onMQTTDisconnect)

--------------------
-- We don't set up the connection here because we do it in the IP callback
--------------------
-- do_mqtt_connect()

------------------------------------------------------------------------------
-- call initialization and run.
------------------------------------------------------------------------------
leds_enable()
notConnected()
wifi.sta.connect()

