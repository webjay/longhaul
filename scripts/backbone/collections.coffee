
class Snapshots extends Backbone.Collection

	model: snapshotModel

	initialize: ->
		$('#snaps').html((new photoListView()).render().$el)
		@on 'add', (model) =>
			view = new photoItemView
				model: model
			$('#snaps .thumbnails').append(view.render().$el)

	parse: (response) ->
		console.log response
		#alert 'hi'
		return []