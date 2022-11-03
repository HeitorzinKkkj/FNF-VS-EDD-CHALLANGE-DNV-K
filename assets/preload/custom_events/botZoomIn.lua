function onEvent(n)
	if n == 'botZoomIn' then
		cancelTween('tordfollowX');
		cancelTween('tordfollowY');
		setProperty('camFollow.x', getProperty('camFollow.x') - 42);
		setProperty('camFollow.y', getProperty('camFollow.y') - 142);
		doTweenX('followPitX', 'camFollowPos', getProperty('camFollow.x'), 0.45, 'expoin');
		doTweenY('followPitY', 'camFollowPos', getProperty('camFollow.y'), 0.45, 'cubein');
		
		doTweenZoom('pitZoom', 'camGame', 2.15, 0.45, 'expoin');
		setProperty('defaultCamZoom', 2.15);
	end
	if n == 'botZoomOut' then
		setProperty('defaultCamZoom', 0.775);
		doTweenZoom('pitZoomOut', 'camGame', 0.775, 0.3, 'expoin');
		
		doTweenAlpha('faceFadeIn', 'botFace', 1, 0.2, 'expoin');
		doTweenX('faceScaleOutX', 'botFace.scale', 1.4, 0.3); --1.4
		doTweenY('faceScaleOutY', 'botFace.scale', 1.4, 0.3);
	end
end

function onTweenCompleted(t)
	if t == 'pitZoom' then
		setProperty('camFollowPos.x', 639.5);
		setProperty('camFollowPos.y', 2057.5);
		setProperty('camFollow.x', 639.5);
		setProperty('camFollow.y', 2057.5);

		setProperty('camGame.scroll.x', 639.5);
		setProperty('camGame.scroll.y', 2057.5);
		
		setProperty('camGame.zoom', 0.775);
		setProperty('defaultCamZoom', 1);
		doTweenZoom('pitZoom2', 'camGame', 1, 0.2, 'expoout');
		
		doTweenAlpha('faceFade', 'botFace', 0.0001, 0.75, 'expoout');
		doTweenX('faceScaleX', 'botFace.scale', 7, 0.6);
		doTweenY('faceScaleY', 'botFace.scale', 7, 0.6);
	end
	if t == 'pitZoomOut' then
		setProperty('camFollow.x', 811.5);
		setProperty('camFollow.y', -745);
		
		setProperty('camGame.scroll.x', 769.5);
		setProperty('camGame.scroll.y', -745);

		setProperty('camFollowPos.x', 769.5);
		setProperty('camFollowPos.y', -745);
		setProperty('camFollow.x', 769.5);
		setProperty('camFollow.y', -745);
		
		setProperty('camFollow.x', getProperty('camFollow.x') + 42);
		setProperty('camFollow.y', getProperty('camFollow.y') + 142);
		doTweenX('outPitX', 'camFollowPos', getProperty('camFollow.x'), 0.45, 'expoout');
		doTweenY('outPitY', 'camFollowPos', getProperty('camFollow.y'), 0.25, 'cubeout');
		
		setProperty('camGame.zoom', 2.15);
		doTweenZoom('pitZoomOut2', 'camGame', 0.715, 0.45, 'expoout');
		setProperty('defaultCamZoom', 0.715);
	end
end
