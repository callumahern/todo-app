# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy

  def total_items
    @total_items ||= todo_items.count
  end

  def completed_items
    @completed_items ||= todo_items.completed.count
  end

  def percent_complete
    return 0 if total_items.zero?

    (100 * completed_items.to_f / total_items).round(1)
  end

  def status
    case percent_complete.to_i
    when 0
      'Not started'
    when 100
      'Complete'
    else
      'In progress'
    end
  end

  def badge_colour
    case percent_complete.to_i
    when 0
      'dark'
    when 100
      'info'
    else
      'primary'
    end
  end
end
