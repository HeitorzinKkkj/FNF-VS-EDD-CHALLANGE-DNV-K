function onCreatePost()
	makeAnimatedLuaSprite('tordStuff', 'edd/tordExtra'); --What if i lerped the planes pos based on getSongPosition()?
	addAnimationByPrefix('tordStuff', 'fall', 'TordHelicopter', 24, false);
	scaleObject('tordStuff', 1.4, 1.4, false);
	setScrollFactor('tordStuff', 0.25, 0.2);
	addLuaSprite('tordStuff', false);
	setObjectOrder('tordStuff', getObjectOrder('plane') + 1);
	setProperty('tordStuff.alpha', 0.0001);
end

function onEvent(n)
	if n == 'tordParachute' then
		dropX = getProperty('plane.x') + 50;
		setProperty('tordStuff.alpha', 1);
		playAnim('tordStuff', 'fall', true);
		setProperty('tordStuff.x', dropX);
		setProperty('tordStuff.y', getProperty('plane.y'));
		doTweenY('firstfall', 'tordStuff', 130, 6/24);
	end
end

tordParachuting = true;
function onTweenCompleted(t)
	if tordParachuting then
		if t == 'firstfall' then
			doTweenX('driftRightF', 'tordStuff', dropX + 30, 8/24, 'sinein'); --sinein
			doTweenY('driftUp', 'tordStuff', 70, 8/24, 'expoout');
		end
		if t == 'driftUp' then
			doTweenX('driftRight', 'tordStuff', dropX + 80, 1.29, 'cubeout');
			doTweenY('driftDown', 'tordStuff', 700, 20.65);
		end
		if t == 'driftRight' then
			doTweenX('driftLeft', 'tordStuff', dropX - 80, 2.58, 'cubeinout');
		end
		if t == 'driftLeft' then
			doTweenX('driftRight', 'tordStuff', dropX + 80, 2.58, 'cubeinout');
		end
		if t == 'driftDown' then
			setProperty('tordStuff.alpha', 0.0001);
			tordParachuting = false;
		end
	end
end
