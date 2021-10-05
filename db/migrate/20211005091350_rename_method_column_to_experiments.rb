class RenameMethodColumnToExperiments < ActiveRecord::Migration[6.0]
  def change
    rename_column :experiments, :method, :experimental_method
  end
end
