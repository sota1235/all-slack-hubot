# Description:
#   telling the time to go back home
#
# Author:
#   @sota1235

cron = require('cron').CronJob

module.exports = (robot) ->
  new cron "0 19 * * 1-5", () ->
    robot.send
      room: "#general"
      , "@channel 定時です。良い子のみんなは帰りましょう"
  , null, true, "Asia/Tokyo"
