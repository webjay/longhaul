
class Snapshots extends Backbone.Collection

	model: snapshotModel

	initialize: ->
		$('#snaps .thumbnails').show()
		@on 'add', (model) =>
			view = new photoItemView
				model: model
			$('#snaps .thumbnails').append(view.render().$el)


class Savings extends Backbone.Collection

	model: savingModel
	storage: new Offline.Storage 'savings', @
	savingsModel: new savingsModel()

	initialize: =>
		
		# keep a score
		new savingsView
			model: @savingsModel

		# Events
		@on 'add', (model) =>
			if not model.isValid()
				return model.destroy()
			if not model.get 'sid'
				model.save()
			view = new savingView
				model: model
			# calc total
			@savingsModel.set 'total', @savingsModel.get('total') + model.get('amount')
			
		# update
		@fetch
			local: true
			
		# sum of amounts
		#@calcTotal()

	calcTotal: ->
		amounts = @pluck 'amount'
		amounts.reduce (previousValue, currentValue) ->
			return currentValue + previousValue
		, 0
