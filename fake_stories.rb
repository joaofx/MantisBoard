require './story'
require './task'
require "yaml"

print "creating fake stories..."
stories = []
file = "stories.yaml"

story1 = Story.new
story1.priority = "1"
story1.id = 1
story1.status = "ToDo"
story1.points = 10
story1.dev_time = 6
story1.title = "User authentication"
story1.tasks << Task.new(1, "Create UI", "ToDo", 5)
story1.tasks << Task.new(2, "Setup libraries, model and migration", "ToDo", 5)

story2 = Story.new
story2.priority = "1"
story2.id = 2
story2.status = "WIP"
story2.points = 10
story2.dev_time = 6
story2.title = "Save User"

stories << story1
stories << story2

puts "Ok"

File.delete(file) if File.exist?(file)
File.write(file, YAML::dump(stories))

puts "Saved as stories.yaml"
puts "\\o/ \\o/ \\o/"