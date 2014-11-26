require 'sinatra'
require 'yaml'
require './story'
require './task'

set :public_folder, 'public'

get '/' do
  @stories = YAML::load(File.read('stories.yaml'))
  erb :index
end
