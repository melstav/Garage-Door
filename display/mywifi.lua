-------------------------------------------------
-- configure ESP as a station
-------------------------------------------------
-- This is commented out because, once it's been saved, it doesn't need
-- to be redone unless it changes.
--
-- We are going to set auto[reconnect] to false so we have an opportunity
-- to set up callbacks before they get called.
-------------------------------------------------
-- wifi_config = 
-- {
-- 	ssid = "YOUR_SSID",
-- 	pwd = "SSID_PW",
-- 	auto = false,
-- 	save = true
-- }
-- wifi.sta.config(wifi_config)
-------------------------------------------------

-------------------------------------------------
-- Declare the callback functions for WIFI events
-------------------------------------------------
function wifi_cb_connected(T)
	print("Connected to WIFI AP.")
	print("\tSSID: "..T.SSID)
	print("\tBSSID: "..T.BSSID)
	print("\tChannel: "..T.channel)
end

function wifi_cb_disconnected(T)
	print("Disconnected from WIFI AP.")
	print("\tSSID: "..T.SSID)
	print("\tBSSID: "..T.BSSID)
	print("\tReason: "..T.reason)
	notConnected()
end

function wifi_cb_got_ip(T)
	print("Got IP from WIFI")
	print("\tStation IP: "..T.IP)
	print("\tSubnet mask: "..T.netmask)
	print("\tGateway IP: "..T.gateway)
	do_mqtt_connect()
end

-- Install the callback functions
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, wifi_cb_connected)
wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, wifi_cb_disconnected)
wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, wifi_cb_got_ip)
-------------------------------------------------

-- wifi.sta.connect()
