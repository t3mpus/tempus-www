
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
http = require("http")
path = require("path")
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
app.get "/", routes.index

require("./routes/sign") app

app.use app.router

app.use (req, res, next) ->
  res.render 404, (err, html)->
    res.send 404, html

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  return

