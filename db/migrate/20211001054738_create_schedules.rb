class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime   :datetime, null: false
      t.string     :plan,     null:false
      t.text       :memo
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
