function onCreatePost()
	makeAnimatedLuaSprite('tordBot', 'edd/tordbot', 430, 167); -- -767 393
	addAnimationByPrefix('tordBot', 'idle', 'TordBot0', 24, true);
	addAnimationByIndices('tordBot', 'idle-alt', 'TordBotBlowingUp', '0,1,2,3', 24);
	addAnimationByIndices('tordBot', 'explode', 'TordBotBlowingUp', '4,5,6,7,8,9,10,11,12,13,14,15,16', 24);
	addOffset('tordBot', 'idle-alt', 646, 253);
	addOffset('tordBot', 'explode', 646, 253);
	playAnim('tordBot', 'idle', true);
	scaleObject('tordBot', 1.42, 1.42, false);
	addLuaSprite('tordBot', false);
	setObjectOrder('tordBot', getObjectOrder('house'));
end

botShake = false;
function onEvent(n)
	if n == 'tordRise' then
		botShake = true;
		doTweenY('tordRising', 'tordBot', -767, 4.84);
		cameraShake('camGame', 0.003, 4.84);
		botOff = getProperty('tordBot.offset.x');
	end
	if n == 'cancelTordTweens' then
		botShake = false;
		cancelTween('tordRising');
		setProperty('tordBot.y', -767);
		setProperty('tordBot.offset.x', 0);
	end
	if n == 'setupEnding' then
		endingSetup = true;
		botShake = true;
		playAnim('tordBot', 'idle-alt', true);
		botOff = getProperty('tordBot.offset.x');
		multS = 3.25;
	end
	if n == 'tordbotExplode' then
		botShake = false;
		altLoop = false;
		playAnim('tordBot', 'explode', true);
		checkForPlode = true;
	end
end

function onTweenCompleted(t)
	if t == 'tordRising' then
		botShake = false;
		setProperty('tordBot.offset.x', 0);
	end
end

botOff = 0;
shakeDir = true;
daTordInitY = 167;
altLoop = true;
endingSetup = false;
tordRemoved = false;
c = 0;
multS = 1;
function onUpdate(e)
	if endingSetup and altLoop then
		playAnim('tordBot', 'idle-alt', false);
	end
	if checkForPlode and not tordRemoved and getProperty('tordBot.animation.curAnim.finished') then
		removeLuaSprite('tordBot', true);
		tordRemoved = true;
	end
	c = e * 400;
	if c % 2 == 0 then
		if botShake then
			setProperty('tordBot.offset.x', botOff + ((shakeDir and 2 or -2) * multS));
			shakeDir = not shakeDir;
		end
	end
end
