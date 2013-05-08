

# document.addEventListener 'deviceready', ->
# 	lh.app.pictureSource = navigator.camera.PictureSourceType
# 	lh.app.destinationType = navigator.camera.DestinationType
# , false


jQuery ($) ->

	Backbone.$ = $
	
	# because with .hide we can not use show()
	$('#snaps .thumbnails').hide()
	$('#savings').hide()

	new navView()

	new productformView
		model: new savingModel()

	app.savings = new Savings()