-- This file defines pin IDs and convenience functions for toggling the LEDs
-- file: leds.lua
-- created 11/04/2018 barryc

-- Initialize the LEDs so we can toggle them.
function leds_enable()
	gpio.mode(pinLEDGreen, gpio.OUTPUT)
	gpio.mode(pinLEDCommon, gpio.OUTPUT)
	gpio.mode(pinLEDRed, gpio.OUTPUT)
	gpio.write(pinLEDCommon, 0)
end

-- Set green LED
function setGreen(val)
	if (val==0) then
		gpio.write(pinLEDGreen, 0)
	else
		gpio.write(pinLEDGreen, 1)
	end
end

-- Set red LED
function setRed(val)
	if (val==0) then
		gpio.write(pinLEDRed, 0)
	else
		gpio.write(pinLEDRed, 1)
	end
end
