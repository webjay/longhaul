class navView extends Backbone.View
	el: '#mainnav'
	events:
		'click a': (event) ->
			event.preventDefault()
			# hide all
			$('#main section').hide()
			# show the selected
			$('#' + $(event.target).data('toggle')).show()


class productformView extends Backbone.View

	el: '#productform'

	events:
		'click #camtoggle': 'capturePhoto'
		'click #savetoggle': 'submit'

	capturePhoto: =>
		#return @photoSuccess(['hello', 'boat'])
		try
			navigator.device.capture.captureImage @photoSuccess, @photoFail,
				limit: 1
			# navigator.camera.getPicture app.photoSuccess, app.photoFail,
			# 	quality: 50
			# 	destinationType: Camera.DestinationType.FILE_URI
		catch error
			console.error error
		
	photoSuccess: (mediaFiles) =>
		@model.set 'mediaFiles', mediaFiles
		new Snapshots mediaFiles,
			silent: false

	photoFail: (message) ->
		# we land here if the user press cancel
		console.error message

	submit: (event) ->
		event.preventDefault()
		sd = @$el.serializeArray()
		data = _(sd).reduce (acc, field) ->
			acc[field.name] = field.value
			return acc
		, {}
		@model.set data
		app.savings.add @model
		# clear form
		@$el[0].reset()
		# remove imgs
		$('#snaps .thumbnails').empty()
		# new model
		@model = new savingModel()
			


class photoItemView extends Backbone.View
	tagName: 'li'
	render: =>
		@$el.html templates.snapshotView
			src: @model.get 'fullPath'
		return @


class savingsView extends Backbone.View
	el: '#savings'
	initialize: =>
		@model.bind 'change', @render, @
	render: =>
		@$('tfoot td:nth-child(2)').html(@model.get('total'))
		return @


class savingView extends Backbone.View
	tagName: 'tr'
	render: =>
		@$el.html templates.savingView(@model.attributes)
		return @
