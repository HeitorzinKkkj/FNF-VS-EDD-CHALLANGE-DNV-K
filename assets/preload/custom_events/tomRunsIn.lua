function onCreatePost()
	addAnimationByPrefix('tom', 'runIn', 'Tom Running In', 24, false);
end

function onEvent(n)
	if n == 'tomRunsIn' then
		scaleObject('tom', 1.67, 1.67, false);
		setProperty('tom.x', 1199);
		setProperty('tom.y', 266);
		setProperty('tom.alpha', 1);
		playAnim('tom', 'runIn', true);
	end
end
