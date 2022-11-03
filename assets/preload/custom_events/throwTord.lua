function onEvent(n)
	if n == 'throwTord' then
		setScrollFactor('tordStuff', 1, 1);
		setObjectOrder('tordStuff', getObjectOrder('tordBot') - 1);
		
		addAnimationByPrefix('tordStuff', 'flail', 'TordFlailing', 24, true);
		
		playAnim('tordStuff', 'flail', true);
		
		setProperty('tordStuff.alpha', 1);
		
		scaleObject('tordStuff', 1.125, 1.125, false);
		setProperty('tordStuff.x', 646);
		setProperty('tordStuff.y', getProperty('tordBot.y') - 35);
		
		doTweenY('throw', 'tordStuff', -1220, 0.89, 'quadout');
	end
end

function onTweenCompleted(t)
	if t == 'throw' then
		doTweenY('throw', 'tordStuff', 500, 1.85, 'smoothstepinout');
	end
end
