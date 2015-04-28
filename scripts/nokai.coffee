# Description:
#   心の叫びを具現化する
#
# Author:
#   @sota1235

module.exports = (robot) ->
  robot.hear /納会/i, (msg) ->
    msg.send "納会なんてないっっ！！！"
