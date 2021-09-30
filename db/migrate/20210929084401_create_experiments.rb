class CreateExperiments < ActiveRecord::Migration[6.0]
  def change
    create_table :experiments do |t|
      t.datetime   :datetime, null: false
      t.integer    :weather_id
      t.float      :temperature
      t.float      :humidity
      t.string     :member
      t.string     :title,    null: false
      t.text       :purpose
      t.text       :method
      t.text       :condition1
      t.text       :condition2
      t.text       :result
      t.text       :consideration
      t.text       :note
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
