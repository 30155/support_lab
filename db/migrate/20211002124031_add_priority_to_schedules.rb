class AddPriorityToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :priority, :string
  end
end
