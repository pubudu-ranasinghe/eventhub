class AddFbUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :fb_link, :string
  end
end
