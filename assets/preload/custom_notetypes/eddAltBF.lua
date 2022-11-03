function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'eddAltBF' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
			setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true);
		end
	end
end

function onCreatePost()
	addCharacterToList('edd-gameOver', 'boyfriend');
end

function goodNoteHit(id, dir, nt, sus)
	if nt == 'eddAltBF' then
		if not getProperty('dad.specialAnim') or getProperty('dad.animation.curAnim.name') == 'turn' then
			playAnim('dad', getProperty('singAnimations[' .. dir .. ']') .. '-alt', true);
			setProperty('dad.holdTimer', 0);
		end
		setPropertyFromClass('GameOverSubstate', 'characterName', 'edd-gameOver');
	end
	if nt == '' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
	end
end

function noteMiss(id, dir, nt, sus)
	if nt == 'eddAltBF' then
		if not getProperty('dad.specialAnim') and getProperty('dad.hasMissAnimations') then
			playAnim('dad', getProperty('singAnimations[' .. dir .. ']') .. 'miss', true);
		end
		setPropertyFromClass('GameOverSubstate', 'characterName', 'edd-gameOver');
	end
	if nt == '' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
	end
end

function onGameOver()
	if getPropertyFromClass('GameOverSubstate', 'characterName') == 'edd-gameOver' then
		setProperty('boyfriend.x', getProperty('dad.x') + 10);
		setProperty('boyfriend.y', getProperty('dad.y') + 227);
	end
	return function_continue;
end
