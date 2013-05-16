class snapshotModel extends Backbone.Model
	
	# for testing
	# defaults:
	# 	fullPath: 'http://farm9.staticflickr.com/8437/7985037130_00a14b4339_d.jpg'


class savingsModel extends Backbone.Model

	defaults:
		total: 0


class savingModel extends Backbone.Model

	defaults:
		photo: 'http://farm9.staticflickr.com/8437/7985037130_00a14b4339_d.jpg'

	initialize: ->

		@on 'change:mediaFiles', (event, data) ->
			# we only allow one photo
			@set 'photo', data[0].fullPath

		@on 'change:amount', (event, data) ->
			amount = parseInt(data, 10)
			@set 'amount', amount || 0

	validate: (attrs, options) ->
		if $.trim(attrs.product) is '' and attrs.amount is 0
			return 'not valid'