'use strict'

module.exports = (grunt) ->
  # Gruntの設定
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

  # defaultのタスクの定義
  grunt.registerTask 'default', 'Log some stuff.', () ->
    # ログメッセージの出力
    grunt.log.write('Logging some stuff...').ok()
