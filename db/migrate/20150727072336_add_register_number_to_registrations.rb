class AddRegisterNumberToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :register_number, :integer
  end
end
