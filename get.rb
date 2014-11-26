require './mantis'
require './story'
require './task'
require "yaml"

user = ARGV[0]
password = ARGV[1]
project = ARGV[2]
mantis_url = ARGV[3]

mantis = Mantis.new(mantis_url)
mantis.login(user, password)
mantis.load_project(project)
mantis.reset_filter
mantis.load_current_sprint_filter('Current Sprint')

stories = mantis.get_stories

stories.each do |story|
  story.tasks = mantis.get_tasks_from_story(story.id)
end

puts "Got #{stories.count} stories"

file = 'stories.yaml'

print "Saving..."

File.delete(file) if File.exist?(file)
File.write(file, YAML::dump(stories))

puts "Saved as stories.yaml"
puts "\\o/ \\o/ \\o/"
