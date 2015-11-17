# Description:
#   hubot counts thanks point
#
# Commands:
#   hubot thanks <username>        - add thanks point to <username>
#   hubot nothanks <username>      - reduce thanks point of <username>
#   hubot thanks delete <username> - delete <username> from thankslist
#   hubot thankslist               - show all user's thanks point
#
# Author:
#   @sota1235

module.exports = (robot) ->
  THANKS_POINT = 'thanks_point'

  # データ取得
  getPoints = () ->
    return robot.brain.get(THANKS_POINT) or {}

  # rangeが+かそれ以外かによってポイントを増減
  changePoint = (name, range) ->
    data  = getPoints()
    point = data[name] or 0
    point += if range is "+" then 1 else -1
    data[name] = point
    robot.brain.set THANKS_POINT, data
    return data[name]

  # リストから名前を削除
  removeName = (name) ->
    data = getPoints()
    if data[name]
      data[name] = false
      return true
    else
      return false

  # リスト表示
  # TODO:ランキング化
  robot.respond /thankslist/i, (msg) ->
    data = getPoints()
    for name, point of data
      if !point
        continue
      msg.send "#{name}: #{point}"

  # リストから名前を削除
  robot.respond /thanks delete (.+)/i, (msg) ->
    name = msg.match[1].split(/\s+/)
    for n, index in name
      if removeName(n)
        msg.send "#{n}さんがリストから削除されました"
      else
        msg.send "#{n}さんはリストに存在しません"

  # お友達に感謝(-人-)
  robot.respond /thanks (.+)/i, (msg) ->
    name = msg.match[1].split(/\s+/)[0]
    if name is "delete"
      return
    new_point = changePoint(name, "+")
    msg.send "#{name}が感謝されました。現在#{new_point}ポイントです。"

  # お友達を減点(´_`)
  robot.respond /nothanks (.+)/i, (msg) ->
    name = msg.match[1].split(/\s+/)
    new_point = changePoint(name, "-")
    msg.send "#{name}が減点されました。現在#{new_point}ポイントです。"
