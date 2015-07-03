class AddEventTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :etype, :string
  end
end
