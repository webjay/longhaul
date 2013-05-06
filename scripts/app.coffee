exports.app = app = {}

app.capturePhoto = ->

	navigator.device.capture.captureImage app.photoSuccess, app.photoFail,
		limit: 1
	
	# navigator.camera.getPicture app.photoSuccess, app.photoFail,
	# 	quality: 50
	# 	destinationType: Camera.DestinationType.FILE_URI

app.photoSuccess = (mediaFiles) ->
	for mediaFile in mediaFiles
		image = document.getElementById 'myImage'
		image.src = mediaFile.fullPath

app.photoFail = (message) ->
	# todo: modal
	alert 'Failed because: ' + message


# document.addEventListener 'deviceready', ->
# 	lh.app.pictureSource = navigator.camera.PictureSourceType
# 	lh.app.destinationType = navigator.camera.DestinationType
# , false


###
jQuery ($) ->

    Backbone.$ = $

    # create map view template
    template = '<h1><%= headline %></h1><%= content %>'
    app.someViewTemplate = _.template template

	# Camera
	# Put event listeners into place
	window.addEventListener 'DOMContentLoaded', ->

		# Grab elements, create settings, etc.
		canvas = document.getElementById('canvas')
		context = canvas.getContext('2d')
		video = document.getElementById('video')
		videoObj = video: true
		errBack = (error) ->
			console.error 'Video capture error: ', error.code
		# Put video listeners into place
		if navigator.getUserMedia # Standard
			navigator.getUserMedia videoObj, (stream) ->
				video.src = stream
				video.play()
			, errBack
		else if navigator.webkitGetUserMedia # WebKit-prefixed
			navigator.webkitGetUserMedia videoObj, (stream) ->
				video.src = window.webkitURL.createObjectURL(stream)
				video.play()
			, errBack

		# Trigger photo take
		document.getElementById('snap').addEventListener 'click', ->
			context.drawImage(video, 0, 0, 640, 480)

	, false
###