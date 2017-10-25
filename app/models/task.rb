class Task < ApplicationRecord
  def complete?
    self.completed
  end

  def mark_as_done
    self.completed = true
  end
end
