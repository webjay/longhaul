module.exports = (grunt) ->

	grunt.initConfig

		coffee:
			options:
				join: true
				bare: true
			compile:
				files:
					'scripts/tmp/app.js': [
						'scripts/backbone/models.coffee'
						'scripts/backbone/collections.coffee'
						'scripts/backbone/templates.coffee'
						'scripts/backbone/views.coffee'
						'scripts/backbone/routes.coffee'
						'scripts/app.coffee'
					]

		uglify:
			components:
				options:
					#sourceMap: 'lib/components.min.js.map'
					mangle: false
					wrap: false
				files:
					'www/lib/components.min.js': [
						'components/jquery/jquery.js'
						'components/underscore/underscore.js'
						'components/backbone/backbone.js'
						'components/backbone.offline/js/backbone_offline.js'
						'components/bootstrap/js/bootstrap-transition.js'
						'components/bootstrap/js/bootstrap-tab.js'
						'components/bootstrap/js/bootstrap-modal.js'
					]
			app:
				options:
					#sourceMap: 'www/lib/app.min.js.map'
					mangle: false
					wrap: false
				files:
					'www/lib/app.min.js': [
						'scripts/tmp/app.js'
					]

		concat:
			bootstrap:
				dest: 'scripts/tmp/bootstrap.less'
				src: [
					'components/bootstrap/less/variables.less'
					'components/bootstrap/less/mixins.less'
					'components/bootstrap/less/reset.less'
					'components/bootstrap/less/scaffolding.less'
					'components/bootstrap/less/grid.less'
					'components/bootstrap/less/layouts.less'
					'components/bootstrap/less/type.less'
					'components/bootstrap/less/forms.less'
					'components/bootstrap/less/buttons.less'
					'components/bootstrap/less/button-groups.less'
					'components/bootstrap/less/navs.less'
					'components/bootstrap/less/navbar.less'
					'components/bootstrap/less/thumbnails.less'
					'components/bootstrap/less/alerts.less'
					'components/bootstrap/less/modals.less'
					'components/bootstrap/less/media.less'
					'components/bootstrap/less/close.less'
					'components/bootstrap/less/utilities.less'
					'components/bootstrap/less/responsive-utilities.less'
					'components/bootstrap/less/responsive-767px-max.less'
					'components/bootstrap/less/responsive-navbar.less'
					'components/bootstrap/less/sprites.less'
					'components/bootstrap/less/tables.less'
					'components/bootstrap/less/modals.less'
				]

		less:
			options:
				compress: true
			components:
				files:
					'www/lib/components.min.css': [
						'scripts/tmp/bootstrap.less'
					]
			app:
				files: 
					'www/lib/style.min.css': [
						'scripts/less/app.less'
					]

		watch:
			coffee:
				files: ['scripts/*.coffee', 'scripts/backbone/*.coffee']
				tasks: ['coffee', 'uglify']
			less:
				files: ['scripts/less/app.less']
				tasks: ['less app']

		connect:
			app:
				options:
					keepalive: true

	grunt.registerTask 'default', ['coffee', 'uglify', 'concat', 'less']

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-concat'
