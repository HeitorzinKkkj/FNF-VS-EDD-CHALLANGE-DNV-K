function onEvent(n)
	if n == 'markstuff' then
		for i = 0, getProperty('eventNotes.length') - 1 do
			if getPropertyFromGroup('eventNotes', i, 'event') == 'eduardoPunch' and not getPropertyFromGroup('eventNotes', i, 'value1') == 'alt' then
				playAnim('mark', 'idle', true);
			end
		end
	end
end
