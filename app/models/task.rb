class Task < ApplicationRecord
  validates :name, presence: true

  def complete?
    self.completed
  end

  def mark_as_done
    self.completed = true
  end
end
