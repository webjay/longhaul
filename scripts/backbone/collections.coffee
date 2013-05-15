
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

	initialize: =>
		
		# keep a score
		@savingsModel = new savingsModel()
		new savingsView
			model: @savingsModel

		# Events
		@on 'add', (model) =>
			model.save()
			view = new savingView
				model: model
			# calc total
			@savingsModel.set 'total', @savingsModel.get('total') + model.get('amount')
			
		# sum of amounts
		@calcTotal()

		# update
		@fetch
			local: true

	calcTotal: ->
		return @reduce (memo, value) ->
			return memo + value.get('amount')
		, 0
