class AddFbUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :fb_url, :string
  end
end
