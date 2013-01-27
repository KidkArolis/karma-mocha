module.exports = (grunt) ->
  grunt.initConfig
    pkgFile: 'package.json'

    files:
      adapter: ['src/adapter.js']

    build:
      adapter: '<%= files.adapter %>'

    # JSHint options
    # http://www.jshint.com/options/
    jshint:
      adapter:
        files:
          src: '<%= files.adapter %>'
        options:
          browser: true,
          es5: true,
          strict: false
          undef: false
          camelcase: false

      options:
        quotmark: 'single'
        camelcase: true
        strict: true
        trailing: true
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        boss: true
        globals: {}

    testacular:
      adapter:
        configFile: 'testacular.conf.js'
        autoWatch: false
        singleRun: true
        reporters: ['dots']

  grunt.loadTasks 'tasks'
  # grunt.loadTasks '../testacular/tasks'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'gruntacular'

  grunt.registerTask 'default', ['build', 'jshint', 'test']
  grunt.registerTask 'test', ['testacular']

  # TODO(vojta): release task
  # grunt.registerTask 'release', 'Build, bump and publish to NPM.', (type) ->
  #   grunt.task.run [
  #     'build',
  #     "bump:#{type||'patch'}",
  #     'npm-publish'
  #   ]