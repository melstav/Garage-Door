-- mqtt-related code for the garage door project
-- file: mqtt.lua
-- created 11/04/2018 barryc


-- Declare functions
-- function onMessage(client, topic, message)
--	print("TOPIC:", topic, "Message:", message)
-- end

function handle_mqtt_connerror(client, reason)
	print("MQTT Connection to server failed. Reason code was: ",reason)
	print("Retrying in 1 seconds.")
	tmr.create():alarm(1 * 1000, tmr.ALARM_SINGLE, do_mqtt_connect)
end

function do_mqtt_connect()
	print("Attempting to connect to MQTT server.")
	m:connect(mqttServer, function(client) print("connected") do_mqtt_subscribe() end, handle_mqtt_connerror)
end

function do_mqtt_subscribe()
	m:subscribe(mqttTopic, 1, function(client) print(mqttTopic, "subscribed") end)
end

--------------------------------------------------------------
-- Declare the global mqtt client
--------------------------------------------------------------
-- m = mqtt.Client("GarageIndicator", 120)
-- m:on("message", onMessage)
-- do_mqtt_connect()
