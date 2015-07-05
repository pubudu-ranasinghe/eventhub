class AddOrganizerDescToEvents < ActiveRecord::Migration
  def change
    add_column :events, :organizer_desc, :text
  end
end
