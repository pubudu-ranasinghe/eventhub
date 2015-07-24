class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :no_of_registrations, :integer
    add_column :events, :organizer_title, :string
    add_column :events, :organizer_tel, :string
  end
end
