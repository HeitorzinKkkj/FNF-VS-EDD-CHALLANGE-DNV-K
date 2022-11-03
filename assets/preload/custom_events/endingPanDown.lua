--3.55
function onEvent(n)
	if n == 'endingPanDown' then
		doTweenX('panDownX', 'camFollow', 800, 3.55, 'smoothStepInOut');
		doTweenY('panDownY', 'camFollow', 390, 3.55, 'smoothStepInOut');
		
		doTweenX('panDownX2', 'camFollowPos', 800, 3.55, 'smoothStepInOut');
		doTweenY('panDownY2', 'camFollowPos', 390, 3.55, 'smoothStepInOut');
	end
end
