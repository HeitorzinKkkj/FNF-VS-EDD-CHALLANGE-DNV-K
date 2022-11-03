function onCreate()
	makeAnimatedLuaSprite('bTord', 'edd/bfTord', 1054, 296);
	addAnimationByPrefix('bTord', 'lookDown', 'BF Ground Shaking', 24, false);
	addAnimationByPrefix('bTord', 'lookUp', 'BF Look At Tord', 24, false);
	addAnimationByPrefix('bTord', 'lookTord', 'BF LookUp', 24, false);
	addOffset('bTord', 'lookDown', 8, -14);
	scaleObject('bTord', 1.05, 1.05, false);
	addLuaSprite('bTord', true);
	setObjectOrder('bTord', getObjectOrder('boyfriendGroup'));
	setProperty('bTord.alpha', 0.0001);
end

function onEvent(n)
	if n == 'bfTord' then
		setProperty('boyfriend.alpha', 0.0001);
		setProperty('bTord.alpha', 1);
		playAnim('bTord', 'lookDown', true);
	end
	if n == 'bfTordUp' then
		playAnim('bTord', 'lookUp', true);
	end
end
