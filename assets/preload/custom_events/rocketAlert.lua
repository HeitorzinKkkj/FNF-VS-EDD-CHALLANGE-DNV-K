function onCreatePost()
	for i = 0, getProperty('strumLineNotes.length') - 1 do
		makeLuaSprite('rocket0' .. i, 'notes/rocketTarget');
		setObjectCamera('rocket0' .. i, 'hud');
		setObjectOrder('rocket0' .. i, getObjectOrder('strumLineNotes') + 1);
		setProperty('rocket0' .. i .. '.x', getPropertyFromGroup('strumLineNotes', i, 'x') - 33.5);
		setProperty('rocket0' .. i .. '.y', getPropertyFromGroup('strumLineNotes', i, 'y') - 31);
		scaleObject('rocket0' .. i, getPropertyFromGroup('strumLineNotes', i, 'scale.x') * 0.8, getPropertyFromGroup('strumLineNotes', i, 'scale.y') * 0.8, false);
		setProperty('rocket0' .. i .. '.alpha', 0.0001);
		
		makeLuaSprite('rocket1' .. i, 'notes/rocketTargetW');
		setObjectCamera('rocket1' .. i, 'hud');
		setObjectOrder('rocket1' .. i, getObjectOrder('strumLineNotes') + 2);
		setProperty('rocket1' .. i .. '.x', getPropertyFromGroup('strumLineNotes', i, 'x') - 33.5);
		setProperty('rocket1' .. i .. '.y', getPropertyFromGroup('strumLineNotes', i, 'y') - 31);
		scaleObject('rocket1' .. i, getPropertyFromGroup('strumLineNotes', i, 'scale.x') * 1.8, getPropertyFromGroup('strumLineNotes', i, 'scale.y') * 1.8, false);
		setProperty('rocket1' .. i .. '.alpha', 0.0001);
		
		addLuaSprite('rocket0' .. i, true);
		addLuaSprite('rocket1' .. i, true);
	end
end

function onEvent(n, v1)
	if n == 'rocketAlert' then
		if v1 == '' then return; end
		cancelTween('aZoom' .. v1);
		cancelTween('disappearZoom' .. v1);
		
		setProperty('rocket0' .. v1 .. '.alpha', 1);
		setProperty('rocket1' .. v1 .. '.alpha', 1);
		
		scaleObject('rocket1' .. v1, getPropertyFromGroup('strumLineNotes', v1, 'scale.x') * 1.8, getPropertyFromGroup('strumLineNotes', v1, 'scale.y') * 1.8, false);
		
		doTweenX('aZoom' .. v1, 'rocket1' .. v1 .. '.scale', getPropertyFromGroup('strumLineNotes', v1, 'scale.x') * 0.8, 0.11);
		doTweenY('aZoomY' .. v1, 'rocket1' .. v1 .. '.scale', getPropertyFromGroup('strumLineNotes', v1, 'scale.x') * 0.8, 0.11);
		doTweenAlpha('disappearZoom' .. v1, 'rocket1' .. v1, 0.0001, 0.085);
		
		cancelTimer('bink' .. v1);
		cancelTimer('bink4' .. v1);
		cancelTimer('disappearTime' .. v1);
		
		runTimer('bink' .. v1, 0.35);
		runTimer('disappearTime' .. v1, 1.29);
		
		_G['blink' .. v1] = true;
	end
end

function onTimerCompleted(t)
	for i = 0, 7 do
		if t == 'bink' .. i then
			blink(i)
			runTimer('bink1' .. i, 0.25);
		end
		if t == 'bink1' .. i then
			blink(i)
			runTimer('bink2' .. i, 0.1);
		end
		if t == 'bink2' .. i then
			blink(i)
			runTimer('bink3' .. i, 0.075);
		end
		if t == 'bink3' .. i then
			blink(i)
			runTimer('bink4' .. i, 0.075, 8);
		end
		if t == 'bink4' .. i then
			blink(i)
		end
		if t == 'disappearTime' .. i then
			_G['blink' .. i] = false;
			setProperty('rocket0' .. i .. '.alpha', 0.0001);
			setProperty('rocket1' .. i .. '.alpha', 0.0001);
		end
	end
end

function blink(target)
	if _G['blink' .. target] then
		cancelTween('disappearBlink' .. target);
		setProperty('rocket1' .. target .. '.alpha', 1);
		doTweenAlpha('disappearBlink' .. target, 'rocket1' .. target, 0.0001, 0.13);
	end
end

blink0 = false;
blink1 = false;
blink2 = false;
blink3 = false;
blink4 = false;
blink5 = false;
blink6 = false;
blink7 = false;