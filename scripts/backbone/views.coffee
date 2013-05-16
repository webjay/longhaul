class navView extends Backbone.View
	el: '#mainnav'
	events:
		'shown a[href="#saveup"]': ->
			$('#productform input[name="product"]').focus()
	

class productformView extends Backbone.View

	el: '#productform'

	events:
		'click #camtoggle': 'capturePhoto'
		'click #savetoggle': 'submit'

	capturePhoto: =>
		try
			navigator.device.capture.captureImage @photoSuccess, @photoFail,
				limit: 1
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
		@collection.add @model
		# Reset
		# clear form
		@$el[0].reset()
		# remove imgs
		$('#snaps .thumbnails').empty()
		# new model
		@model = new savingModel()
		# Modal
		$('#modalSavingDone').modal()


class photoItemView extends Backbone.View
	tagName: 'li'
	render: =>
		@$el.html templates.snapshotView
			src: @model.get 'fullPath'
		return @


class savingsView extends Backbone.View
	el: '#savings'
	initialize: =>
		@model.on 'change', @render
	render: =>
		total = @model.get('total')
		@$('tfoot td:nth-child(2)').html total
		return @


class savingView extends Backbone.View
	tagName: 'tr'
	initialize: ->
		$('#savings tbody').append(@render().$el)
	render: =>
		attributes = _.clone @model.attributes
		attributes.amount = attributes.amount
		@$el.html templates.savingView attributes
		return @


class modalSavingDoneView extends Backbone.View
	el: '#modalSavingDone'
	events:
		'show': 'render'
	cheers: ['Awesome', 'Bravo', 'Excellent']
	cheer: ->
		return @cheers[Math.floor(Math.random() * @cheers.length)]
	render: =>
		@model = @collection.at(@collection.length - 1)
		attributes =
			amount: @model.get 'amount'
			total: @collection.savingsModel.get 'total'
			cheer: @cheer()
		@$('.modal-body').html templates.modalSavingDone attributes
		return @
