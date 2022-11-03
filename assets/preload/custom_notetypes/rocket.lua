function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rocket' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/rocket');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/notesplashes/explosion');
			setPropertyFromGroup('unspawnNotes', i, 'offsetY', downscroll and -180 or -5);
			setPropertyFromGroup('unspawnNotes', i, 'offsetX', -1);
			setPropertyFromGroup('unspawnNotes', i, 'flipY', downscroll);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
			setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true);
			setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1.9);
		end
	end
end

function goodNoteHit(id, dir, nt, sus)
	if nt == 'rocket' then
		runHaxeCode([[
			game.spawnNoteSplash(]] .. 
			getPropertyFromGroup('notes', id, 'x') - 10 .. [[, ]] .. 
			(getPropertyFromGroup('notes', id, 'y') + (downscroll and 127.5 or 40)).. [[, ]] .. 
			dir .. [[, game.notes.members[]] .. 
			id .. [[]);
		]]);
	end
end

function noteMiss(id, dir, nt, sus)
	if nt == 'rocket' then
		setHealth(-1);
	end
end
