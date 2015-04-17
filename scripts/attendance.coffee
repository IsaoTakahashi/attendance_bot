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
