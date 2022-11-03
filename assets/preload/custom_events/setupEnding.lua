function onEvent(n)
	if n == 'setupEnding' then
		setProperty('dad.x', defaultOpponentX);
		setProperty('dad.y', defaultOpponentY + 130);
		
		scaleObject('bTord', 1.02, 1.02, false);
		
		setProperty('bTord.x', 1099);
		setProperty('bTord.y', 306);
		
		setProperty('tom.x', 589);
		setProperty('tom.y', 236);
		
		scaleObject('tom', 1.025, 1.0275);
		
		addAnimationByIndices('tom', 'lookTord', 'TomHarpoonLine', '0,1,2,3');
		addAnimationByIndices('tom', 'turnTalk', 'TomHarpoonLine', '5,6,7,8,9,10');
		addAnimationByIndices('tom', 'talk', 'TomHarpoonLine', '11,12,13,14');
		addAnimationByIndices('tom', 'endTalk', 'TomHarpoonLine', '15,16,17,18,19,20,21');
		
		playAnim('dad', 'lookTord', true);
		playAnim('bTord', 'lookTord', true);
		playAnim('matt', 'lookTord', true);
		playAnim('tom', 'lookTord', true);
	end
end
