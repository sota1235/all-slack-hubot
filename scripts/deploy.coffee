# Description:
#   デプロイ通知
#
# Author:
#   @shokai
#
# Thanks:
#   https://github.com/masuilab/slack-hubot/blob/master/scripts/deploy-notify.coffee


module.exports = (robot) ->

  cid = setInterval ->
    return if typeof robot?.send isnt 'function'
    robot.send {room: "news"}, "Hubot、起動しました"
    clearInterval cid
  , 1000
