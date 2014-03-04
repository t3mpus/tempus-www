{Strategy} = require 'passport-local'

module.exports = (passport)->

  passport.use new Strategy(
    { usernameField: 'email' },
    (email, passport, done) ->
  )


