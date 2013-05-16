

# document.addEventListener 'deviceready', ->
# 	lh.app.pictureSource = navigator.camera.PictureSourceType
# 	lh.app.destinationType = navigator.camera.DestinationType
# , false

jQuery ($) ->

	Backbone.$ = $
	
	new navView()
	
	savings = new Savings()
	
	new productformView
		collection: savings
		model: new savingModel()

	new modalSavingDoneView
		collection: savings

	# new Router()
	# Backbone.history.start()
