class Router extends Backbone.Router

	routes:
		'saveup': 'saveup'
		'savings': 'savings'
		'*path': 'saveup' #default
		
	hideAll: ->
		$('#main section').hide()
		
	saveup: ->
		#@hideAll()
		#$('#saveup').show()
		$('#saveup').tab('show')

	savings: ->
		#@hideAll()
		#$('#savings').show()
		$('#savings').tab('show')
