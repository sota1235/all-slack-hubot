# Description:
#   hubot counts thanks point
#
# Commands:
#   hubot thanks <username> - add thanks point to <username>
#   hubot thankslist       - show all user's thanks point
#
# Author:
#   @sota1235

module.exports = (robot) ->
  THANKS_POINT = 'thanks_point'

  getPoints = () ->
    return robot.brain.get(THANKS_POINT) or {}

  changePoint = (name, range) ->
    data  = getPoints()
    point = data[name] or 0
    if rangie is "+"
      point += 1
    else
      point -= 1
    data[name] = point
    robot.brain.set THANKS_POINT, data
    return data[name]

  robot.respond /thankslist/i, (msg) ->
    data = getPoints()
    console.log data
    for name, point of data
      msg.send "#{name}: #{point}"

  robot.respond /thanks (.+)/i, (msg) ->
    name = msg.match[1].split(/\s+/)
    new_point = changePoint(name, "+")
    msg.send "#{name}が感謝されました。現在#{new_point}ポイントです。"

  robot.respond /nothanks (.+)/i, (msg) ->
    name = msg.match[1].split(/\s+/)
    new_point = changePoint(name, "-")
    msg.send "#{name}が減点されました。現在#{new_point}ポイントです。"

  robot.hear /ありがとう/, (msg) ->
    msg.send "感謝の心を大切に…。ぜひhubot thanks nameをご活用ください！"
