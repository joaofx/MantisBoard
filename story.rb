class Story
  attr_accessor :id,
                :status,
                :points,
                :dev_time,
                :title,
                :priority,
                :tasks

  def initialize
    self.tasks = []
  end

  def get_todo
    tasks.select { |s| s.status == 'ToDo' }
  end

  def get_wip
    tasks.select { |s| s.status == 'WIP' }
  end

  def get_resolved
    tasks.select { |s| s.status == 'Resolved' }
  end

end
