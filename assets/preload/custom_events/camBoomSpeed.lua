function onEvent(n, v1)
	if n == 'camBoomSpeed' then
		speed = tonumber(v1);
	end
end

speed = 4;
function onBeatHit()
	if curBeat % speed == 0 and curBeat % 4 ~= 0 then
		if getPropertyFromClass('ClientPrefs', 'camZooms') and getProperty('camZooming') then
			setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * getProperty('camZoomingMult'));
			setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * getProperty('camZoomingMult'));
		end
	end
end
