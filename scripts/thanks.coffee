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

  changePoint = (name) ->
    data  = getPoints()
    point = data[name] or 0
    point += 1
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
    new_point = changePoint(name)
    msg.send "#{name}: #{new_point}"
