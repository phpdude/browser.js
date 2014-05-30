module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      lib: [
        "lib/vendor/*", "!lib/vendor/.*", "lib/browser*"
      ]
      example: [
        "examples/example.*"
      ]

    uglify:
      browser:
        options:
          preserveComments: false
          report: 'gzip'
          banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */\n'

        files:
          "lib/browser.min.js": [
            "lib/vendor/platform.js",
            "lib/browser.js",
          ]
      example:
        options:
          preserveComments: false
          banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */\n'

        files:
          "examples/example.min.js": [
            "lib/browser.min.js",
            "examples/example.js",
          ]

    curl:
      "lib/vendor/platform.js": "https://raw.githubusercontent.com/bestiejs/platform.js/master/platform.js"

    coffee:
      compile:
        options:
          banner: '/*! <%= pkg.name %> <%= pkg.version %> */\n'
          join: yes
        files:
          'lib/browser.js': [
            'src/browser.coffee'
          ]
          'examples/example.js': [
            'src/example.coffee'
          ]

    bumpup: 'package.json'

    watch:
      coffeescripts:
        files: [
          'src/browser.coffee',
          'src/example.coffee'
        ]
        tasks: ['build']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bumpup'
  grunt.loadNpmTasks 'grunt-curl'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build', ['coffee', 'uglify']
  grunt.registerTask 'release', ['clean', 'curl', 'bump', 'build']

  grunt.registerTask 'bump', (type) ->
    type = if type then type else 'patch'
    grunt.task.run "bumpup:#{type}"
