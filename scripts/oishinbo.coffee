# Description:
#   心の叫びを具現化する
#
# Author:
#   @sota1235

_ = require 'lodash'

module.exports = (robot) ->
  robot.hear /おなかすいた|おいしい|うまい|美味/i, (msg) ->
    words = [
      "おいしんぼ！！！"
      "おいしんぼ…作って欲しいな…"
      "食こそ至高！"
    ]
    msg.send _.sample words
