require 'sinatra'
require 'pg'

get '/' do
  database = PG.connect(dbname: "tiy-sports")
  @rows = database.exec("SELECT count(players.id), teams.name, teams.description, teams.image_url FROM players, teams, memberships WHERE players.id = memberships.player_id AND teams.id = memberships.team_id group by teams.name, teams.description, teams,image_url")

  erb :home
end
