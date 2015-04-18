# Description:
#   test
# Commands:
#   hubot servo - drive servo motor


module.exports = (robot) ->
  robot.hear /servo (\d+)/i, (msg) ->
    #msg.send 'received message'
    robot.http("http://49.135.3.9:8080/servo/" + msg.match[1]).get() (err, res, body) ->
        if err
            msg.send "sorry, #{msg.message.user.name}."
            msg.send "#{err}"
        msg.send "#{body}"
  robot.hear /I'll be late for (\d+) min due to (.+)./i, (msg) ->
    msg.send "#{msg.message.user.name} attendance info. #{msg.match[1]} - #{msg.match[2]}"
    data = JSON.stringify {
      employee_name: "#{msg.message.user.name}",
      registant_name: "Chat Bot",
      target_date: "2015-04-20",
      status: "Late Arrival",
      reason: "#{msg.match[2]}",
      from: "-",
      to: "09:" + "#{msg.match[1]}",
      comment: "from Slack"
    }
    robot.http("http://49.135.3.9:8080/attendance").post(data) (err, res, body) ->
        if err
            msg.send "sorry, attendance info was not registered correctly."
            msg.send "#{err}"
    robot.http("http://49.135.3.9:8080/servo/100").get() (err, res, body) ->
        if err
            msg.send "sorry, tag device was not work."
            msg.send "#{err}"
