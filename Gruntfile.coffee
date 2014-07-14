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
          'lib/components.min.js': [
            'bower_components/jquery/jquery.js'
            'bower_components/underscore/underscore.js'
            'bower_components/backbone/backbone.js'
            'bower_components/backbone.offline/js/backbone_offline.js'
            'bower_components/bootstrap/js/bootstrap-transition.js'
            'bower_components/bootstrap/js/bootstrap-tab.js'
            'bower_components/bootstrap/js/bootstrap-modal.js'
          ]
      app:
        options:
          #sourceMap: 'lib/app.min.js.map'
          mangle: false
          wrap: false
        files:
          'lib/app.min.js': [
            'scripts/tmp/app.js'
          ]

    # concat:
    #   bootstrap:
    #     dest: 'scripts/tmp/bootstrap.less'
    #     src: [
    #       'bower_components/bootstrap/less/variables.less'
    #       'bower_components/bootstrap/less/mixins.less'
    #       'bower_components/bootstrap/less/reset.less'
    #       'bower_components/bootstrap/less/scaffolding.less'
    #       'bower_components/bootstrap/less/grid.less'
    #       'bower_components/bootstrap/less/layouts.less'
    #       'bower_components/bootstrap/less/type.less'
    #       'bower_components/bootstrap/less/forms.less'
    #       'bower_components/bootstrap/less/buttons.less'
    #       'bower_components/bootstrap/less/button-groups.less'
    #       'bower_components/bootstrap/less/navs.less'
    #       'bower_components/bootstrap/less/navbar.less'
    #       'bower_components/bootstrap/less/thumbnails.less'
    #       'bower_components/bootstrap/less/alerts.less'
    #       'bower_components/bootstrap/less/modals.less'
    #       'bower_components/bootstrap/less/media.less'
    #       'bower_components/bootstrap/less/close.less'
    #       'bower_components/bootstrap/less/utilities.less'
    #       'bower_components/bootstrap/less/responsive-utilities.less'
    #       'bower_components/bootstrap/less/responsive-767px-max.less'
    #       'bower_components/bootstrap/less/responsive-navbar.less'
    #       'bower_components/bootstrap/less/sprites.less'
    #       'bower_components/bootstrap/less/tables.less'
    #       'bower_components/bootstrap/less/modals.less'
    #     ]
    less:
      bootstrap:
        options:
          compress: true
          paths: ['bower_components/bootstrap/less']
        files:
          'lib/bootstrap.min.css': ['scripts/less/bootstrap.less']
      app:
        options:
          compress: true
        files:
          'lib/style.min.css': [
            'scripts/less/app.less'
          ]

    watch:
      coffee:
        files: ['scripts/*.coffee', 'scripts/backbone/*.coffee']
        tasks: ['coffee', 'uglify:app']
      less:
        files: ['scripts/less/app.less']
        tasks: ['less:app']

    connect:
      app:
        options:
          keepalive: true

  grunt.registerTask 'default', ['coffee', 'uglify', 'less']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
