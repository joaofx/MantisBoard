require 'capybara'

class Mantis
  def initialize(url)
    Capybara.default_driver = :selenium
    @session = Capybara::Session.new(:selenium)
    @url = url
  end

  def login(user, password)
    print "logging as #{user}..."

    @session.visit @url

    @session.fill_in "username", with: user
    @session.fill_in "password", with: password
    @session.click_on "Login"

    puts "Ok"
  end

  def load_project(project)
    print "loading project..."

    @session.select(project, :from => 'project_id')
    @session.click_on "Switch"

    puts "Ok"
  end

  def reset_filter
    print "reseting filter..."

    @session.click_on "View"
    @session.select('[Reset Filter]', :from => 'source_query_id')
    @session.click_on "Use Filter"

    puts "Ok"
  end

  def load_current_sprint_filter(current_sprint_filter_name)
    @session.select(current_sprint_filter_name, :from => 'source_query_id')
  end

  def get_stories
    print "getting stories..."
    stories = []

    @session.all('#buglist tr').each do |tr|
      next unless tr[:bgcolor] != nil

      cols = tr.all('td')

      story = Story.new
      story.priority = cols[2].text
      story.id = cols[3].text
      story.status = cols[6].text
      story.points = cols[9].text
      story.dev_time = cols[10].text
      story.title = cols[12].text

      print "#{story.id}..."
      stories << story

      #puts "[#{story.priority}] #{story.id} - #{story.title}"
    end

    puts "Ok"
    stories
  end

  def get_tasks_from_story(id)
    @session.visit "#{@url}/view.php?id=#{id}"

    print "getting tasks from #{id}..."

    tasks = []

    @session.all('#relationships_open tr').each do |tr|
      next unless tr[:bgcolor] != nil

      cols = tr.all('td')

      task = Task.new
      task.relationship = cols[0].text
      task.id = cols[1].text
      task.points = cols[3].text
      task.status = cols[4].text
      task.assigned = cols[5].text
      task.title = cols[7].text
      task.title.slice! "[Delete]"

      print "#{task.id}..."
      tasks << task

      #puts "#{task.id} - #{task.title}"
    end

    puts "Ok"
    tasks
  end
end
