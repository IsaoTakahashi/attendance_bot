
module.exports = (robot) ->
  robot.hear /servo/i, (msg) ->
    robot.http('http://49.135.3.9/servo/100').get() (err, res, body) ->
        if res.statusCode is 200
            msg.send 'success'
