# Description:
#   test
# Commands:
#   hubot servo - drive servo motor


module.exports = (robot) ->
  robot.hear /servo/i, (msg) ->
    msg.send 'received message'
    robot.http('http://49.135.3.9/servo/100').get() (err, res, body) ->
        if res.statusCode is 200
            msg.send "#{res.data}"
        if err
            msg.send "sorry, #{msg.message.user.name}."
