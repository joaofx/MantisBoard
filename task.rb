class Task
  attr_accessor :id,
                :points,
                :status,
                :assigned,
                :title,
                :relationship

  def initialize(id, title, status, points)
    @id = id
    @points = points
    @status = status
    @title = title
  end
end
