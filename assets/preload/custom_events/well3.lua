function onEvent(n)
	if n == 'well3' then
		doTweenColor('skyTween3', 'sky', 'B4B4B4', 0.08);
		doTweenColor('cloudsTween3', 'clouds', 'B4B4B4', 0.08);
		doTweenColor('housesTween3', 'houses', 'B4B4B4', 0.08);
		doTweenZoom('eduardoFoc3', 'camGame', 0.815, 0.08);
		setProperty('defaultCamZoom', 0.815);
		setProperty('camFollow.y', getProperty('camFollow.y') - 4.16);
		doTweenY('camFollow3', 'camFollowPos', getProperty('camFollow.y'), 0.08);
	end
end
