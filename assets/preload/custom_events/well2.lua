function onEvent(n)
	if n == 'well2' then
		doTweenColor('skyTween2', 'sky', 'CACACA', 0.08);
		doTweenColor('cloudsTween2', 'clouds', 'CACACA', 0.08);
		doTweenColor('housesTween2', 'houses', 'CACACA', 0.08);
		doTweenZoom('eduardoFoc2', 'camGame', 0.78, 0.08);
		setProperty('defaultCamZoom', 0.78);
		setProperty('camFollow.y', getProperty('camFollow.y') - 4.16);
		doTweenY('camFollow2', 'camFollowPos', getProperty('camFollow.y'), 0.08);
	end
end
