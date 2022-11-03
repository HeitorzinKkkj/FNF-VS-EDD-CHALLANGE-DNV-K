function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'tord' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end

function opponentNoteHit(id, dir, nt, sus)
	if nt == 'tord' then
		if not lowQuality and not sus then
			triggerEvent('Screen Shake', '0.22, 0.002', '0, 0');
		end
		health = getProperty('health')
		if health > 0.2 then
			addHealth(-0.02); --0.05
		end
	end
end
