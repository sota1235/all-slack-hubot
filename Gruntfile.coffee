'use strict'

module.exports = (grunt) ->
  # プラグイン読み込み
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-jsonlint'

# タスク定義
  grunt.registerTask 'test',    [ 'coffeelint', 'jsonlint' ]
  grunt.registerTask 'default', [ 'test' ]

  # Gruntの設定
  grunt.initConfig
    coffeelint:
      app: ['scripts/*.coffee']

    jsonlint:
      config:
        src: [
          'package.json'
          'external-scripts.json'
          'hubot-scripts.json'
        ]
