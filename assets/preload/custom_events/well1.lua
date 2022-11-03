function onEvent(n)
	if n == 'well1' then
		doTweenColor('skyTween1', 'sky', 'E5E5E5', 0.08);
		doTweenColor('cloudsTween1', 'clouds', 'E5E5E5', 0.08);
		doTweenColor('housesTween1', 'houses', 'E5E5E5', 0.08);
		doTweenZoom('eduardoFoc1', 'camGame', 0.75, 0.08);
		setProperty('defaultCamZoom', 0.75);
		setProperty('camFollow.y', getProperty('camFollow.y') - 4.16);
		doTweenY('camFollow1', 'camFollowPos', getProperty('camFollow.y'), 0.08);
	end
end
