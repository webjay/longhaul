module.exports = (grunt) ->

	grunt.initConfig

		less:
			options:
				compress: true
			components:
				files:
					'lib/components.min.css': [
						'_scripts/bootstrap.less'
					]

		watch:
			less:
				files: ['_scripts/*.less']
				tasks: ['less']

	grunt.registerTask 'default', ['less']

	# grunt.loadNpmTasks 'grunt-contrib-coffee'
	# grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'

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
