# frozen_string_literal: true

class CreateTodoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
