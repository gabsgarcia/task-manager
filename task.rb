class Task
  # forma/estrutura do objeto
  attr_reader :title

  def initialize(title)
    @title = title
    @completed = false
  end


  def mark_as_completed!
    @completed = true
  end

  def completed?
    @completed
  end
end
