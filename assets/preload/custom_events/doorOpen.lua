function onCreatePost()
	makeAnimatedLuaSprite('door', 'edd/door', 611, 211);
	addAnimationByPrefix('door', 'open', 'Door Opening', 24, false);
	addAnimationByIndices('door', 'close', 'Door Opening', '5,4,3,2,1,0');
	scaleObject('door', 1.4, 1.4, false);
	setProperty('door.alpha', 0.0001);
	addLuaSprite('door', false);
	setObjectOrder('door', getObjectOrder('house') + 1);
end

function onEvent(n)
	if n == 'doorOpen' then
		setProperty('door.alpha', 1);
		playAnim('door', 'open', true);
		runTimer('doorOpen', .64);
	end
end

function onTimerCompleted(t)
	if t == 'doorOpen' then
		playAnim('door', 'close', true);
		runTimer('doorClose', 5/24);
	end
	if t == 'doorClose' then
		setProperty('door.alpha', 0.0001);
	end
end
