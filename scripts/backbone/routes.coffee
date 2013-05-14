class Router extends Backbone.Router

	routes:
		'saveup': 'saveup'
		'savings': 'savings'
		'*path': 'saveup'
		
	hideAll: ->
		$('#main section').hide()
		
	saveup: ->
		@hideAll()
		$('#saveup').show()

	savings: ->
		@hideAll()
		$('#savings').show()
