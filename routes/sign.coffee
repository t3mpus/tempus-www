module.exports = (app, passport) ->

  password = {id: 'password', text: 'Password', type: 'password'}
  email = {id: 'email', text: 'Email', type: 'email'}

  up_inputs = [
    {id: 'firstName', text: 'First Name'}
    {id: 'lastName', text: 'Last Name'}
    email
    password
    {id: 'passwordConfirm', text: 'Confirm Password', type: 'password'}
  ]

  in_inputs = [
    email
    password
  ]

  app.get '/sign/in', (req, res) ->
    res.render 'sign/index',
      inputs: in_inputs
      action: '/sign/in'
      submit: 'Sign In'

  app.get '/sign/up', (req, res)->
    res.render 'sign/index',
      inputs: up_inputs
      action: '/sign/up'
      submit: 'Sign Up!'

  app.get '/sign/out', (req, res)->
    res.render '/sign/out'

