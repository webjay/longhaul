
class cameraButtonView extends Backbone.View

	#el: '#camtoggle'

	events:
		'click': 'capturePhoto'

	initialize: =>
		@$el = $('#camtoggle')
		
	capturePhoto: =>
		#return @photoSuccess(['hello', 'boat'])
		try
			navigator.device.capture.captureImage @photoSuccess, @photoFail,
				limit: 1
			# navigator.camera.getPicture app.photoSuccess, app.photoFail,
			# 	quality: 50
			# 	destinationType: Camera.DestinationType.FILE_URI
		catch error
			#alert error
			console.error error
		
	photoSuccess: (mediaFiles) ->
		new Snapshots mediaFiles,
			silent: false

	photoFail: (message) ->
		# we land here if the user press cancel
		console.error message

class photoListView extends Backbone.View
	tagName: 'ul'
	className: 'thumbnails'

class photoItemView extends Backbone.View
	tagName: 'li'
	render: =>
		@$el.html templates.snapshotView
			src: @model.get 'fullPath'
		return @
