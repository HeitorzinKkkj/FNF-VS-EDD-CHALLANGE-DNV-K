function onEvent(n)
	if n == 'tordCamFollow' then
		doTweenX('tordfollowX', 'camFollowPos', 811.5, 4.84, 'SineInOut');
		doTweenY('tordfollowY', 'camFollowPos', -603, 4.84, 'SineInOut');
		setProperty('camFollow.x', 811.5);
		setProperty('camFollow.y', -603);
		setProperty('isCameraOnForcedPos', true);
	end
end
