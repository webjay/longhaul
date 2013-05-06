module.exports = (grunt) ->

	grunt.initConfig

		coffee:
			compile:
				files:
					'scripts/tmp/app.js': 'scripts/app.coffee'

		uglify:
			components:
				options:
					sourceMap: 'lib/components.js.map'
					mangle: false
				files:
					'lib/components.min.js': [
						'components/underscore/underscore.js'
						'components/backbone/backbone.js'
					]
			app:
				options:
					sourceMap: 'lib/app.js.map'
					mangle: false
					wrap: 'lh'
				files:
					'lib/app.min.js': [
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
				]

		less:
			options:
				compress: true
			components:
				files:
					'lib/components.min.css': [
						'scripts/tmp/bootstrap.less'
					]
			app:
				files: 
					'lib/style.min.css': [
						'scripts/less/app.less'
					]

		watch:
			coffee:
				files: ['scripts/*.coffee']
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

	grunt.registerTask 'gitploy', 'Deploy to GitHub Pages', ->
		paths = ['lib', 'index.html']
		Git = require 'git-wrapper'
		git = new Git()
		done = @async()
		git.exec 'checkout gh-pages', (err) ->
			throw err if err?
			git.exec 'checkout master -- ' + paths.join(' '), (err) ->
				throw err if err?
				git.exec 'commit -am "updates from master"', (err) ->
					throw err if err?
					git.exec 'push origin gh-pages', (err) ->
						throw err if err?
						git.exec 'checkout master', (err) ->
							throw err if err?
							done()
