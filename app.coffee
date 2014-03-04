
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
http = require("http")
path = require("path")
passport = require 'passport'
app = express()

app.locals.title = "Tempus"

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use require('connect-assets') helperContext: app.locals
app.use "/assets", express.static(path.join(__dirname, "assets"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

# configure passport

require('./passport-settings') passport

# routes
app.get "/", routes.index

require("./routes/sign") app, passport

app.use app.router

# 404 handler
app.use (req, res, next) ->
  res.render 404

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  return

