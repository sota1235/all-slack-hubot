# Description:
#   hubot memory todo
#
# Commands:
#   hubot todo add TASK - add thanks point to <username>
#   hubot todo list     - reduce thanks point of <username>
#   hubot todo delete N - delete <username> from thankslist
#
# Author:
#   @sota1235

module.exports = (robot) ->
  TODO = 'todo_list'

  # データ取得
  getTodo = () ->
    data = robot.brain.get(TODO) or {}
    return data["todo"] or []

  # rangeが+かそれ以外かによってポイントを増減
  addTodo = (todo) ->
    data  = getTodo()
    data.push(todo)
    robot.brain.set TODO, {"todo": data}
    return true

  # リストからタスクを削除
  removeTodo = (index) ->
    data = getTodo()
    if data.length < index
      return false
    todo = data[index-1]
    data.splice(index-1, 1)
    robot.brain.set TODO, {"todo": data}
    return todo

  # リスト表示
  robot.respond /todo list$/i, (msg) ->
    data = getTodo()
    if data.length == 0
      msg.send "TODOはありません＼(^o^)／"
      return
    else
      msg.send "TODOリストだｺﾞﾗｧ"

    for todo, index in data
      msg.send "#{index+1}: #{todo}"
    return

  # タスクを追加
  robot.respond /todo add (.+)/i, (msg) ->
    todo = msg.match[1].split(/\s+/)[0]
    if addTodo(todo)
      msg.send "TODO \"#{todo}\"を追加しました"
    else
      msg.send "TODOの登録に失敗しました"

  # タスクを削除
  robot.respond /todo delete (\d)/i, (msg) ->
    index = msg.match[1]
    if removeTodo(index)
      msg.send "TODOを削除しました"
    else
      msg.send "TODOの削除に失敗しました"
