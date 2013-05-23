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
