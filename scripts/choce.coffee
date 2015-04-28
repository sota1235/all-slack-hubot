# Description
#   1つランダムに選ぶ
#
# Commands:
#   hubot choice ほげ もげ ふが
#
# Author:
#   @sota1235
#
# Thanks:
#   https://github.com/masuilab/slack-hubot/blob/master/scripts/choice.coffee

_ = require 'lodash'

module.exports = (robot) ->
  robot.respond /choice (.+)/i, (msg) ->
    items = msg.match[1].split(/\s+/)
    choice = _.sample items
    msg.send "厳正な抽選の結果、「#{choice}」に決まりました
