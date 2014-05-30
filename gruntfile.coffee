module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    copy:
      browser:
        src: 'build/browser.js'
        dest: 'lib/browser.min.js'
        nonull: true
      example:
        src: 'build/browser.js'
        dest: 'examples/example.js'
        nonull: true

    clean:
      build: [
        "build/"
      ]
      lib: [
        "lib/vendor/*", "!lib/vendor/.*"
      ]
      example: [
        "examples/example.js"
      ]

    requirejs:
      compile:
        options:
          appDir: "lib/"
          dir: "build/"
          baseUrl: "."
          optimize: "uglify"
          logLevel: 0
          findNestedDependencies: true
          fileExclusionRegExp: /^\./
          inlineText: true
          modules: [
            {
              name: "browser",
            },
            {
              name: "example",
            }
          ],
          paths:
            platform: "vendor/platform"

    curl:
      "lib/vendor/platform.js": "https://raw.githubusercontent.com/bestiejs/platform.js/master/platform.js"
      "lib/vendor/jquery.js": "http://code.jquery.com/jquery-2.1.1.min.js"
      "lib/require.js": "https://raw.githubusercontent.com/jrburke/requirejs/2.1.10/require.js"

    coffee:
      compile:
        options:
          banner: '/*! <%= pkg.name %> <%= pkg.version %> */\n'
          join: yes
        files:
          'lib/browser.js': [
            'src/browser.coffee'
          ]
          'lib/example.js': [
            'src/example.coffee'
          ]

    bumpup: 'package.json'

    watch:
      coffeescripts:
        files: [
          'src/browser.coffee',
          'src/example.coffee'
        ]
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bumpup'
  grunt.loadNpmTasks 'grunt-curl'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build', ['coffee', 'requirejs', 'copy']
  grunt.registerTask 'release', ['clean', 'curl', 'bump', 'build']

  grunt.registerTask 'bump', (type) ->
    type = if type then type else 'patch'
    grunt.task.run "bumpup:#{type}"
