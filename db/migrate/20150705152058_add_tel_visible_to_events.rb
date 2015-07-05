class AddTelVisibleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :telephone_visible, :boolean, default: false
  end
end
