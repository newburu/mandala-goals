class AddLevelToAnnualThemes < ActiveRecord::Migration[7.1]
  def change
    add_column :annual_themes, :level, :integer, default: 2, null: false
  end
end
