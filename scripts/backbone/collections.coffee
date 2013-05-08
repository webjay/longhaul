
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

	initialize: =>

		@savingsModel = new savingsModel
			collection: @
		new savingsView
			model: @savingsModel

		@on 'add', (model) =>
			view = new savingView
				model: model
			$('#savings tbody').append(view.render().$el)
			# calc total
			@savingsModel.set 'total', @calcTotal()

	calcTotal: ->
		return @reduce (memo, value) ->
			val = value.get('amount') || 0
			return memo + parseInt(val, 10)
		, 0
