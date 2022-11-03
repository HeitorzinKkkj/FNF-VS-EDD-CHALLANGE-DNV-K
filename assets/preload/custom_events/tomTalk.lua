function onEvent(n)
	if n == 'tomTalk' then
		playAnim('tom', 'turnTalk', true);
		runTimer('turnTalkTimer', 6/24);
	end
	if n == 'tomEndTalk' then
		tomCanTalk = false;
		playAnim('tom', 'endTalk', true);
	end
end

function onTimerCompleted(t)
	if t == 'turnTalkTimer' then
		playAnim('tom', 'talk', true);
		tomCanTalk = true;
	end
end

tomCanTalk = false;

function onUpdate()
	if tomCanTalk then
		playAnim('tom', 'talk', false);
	end
end
