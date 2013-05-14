

# document.addEventListener 'deviceready', ->
# 	lh.app.pictureSource = navigator.camera.PictureSourceType
# 	lh.app.destinationType = navigator.camera.DestinationType
# , false


Zepto ($) ->

	Backbone.$ = $
	
	new productformView
		collection: new Savings()
		model: new savingModel()

	new Router()
	Backbone.history.start()
