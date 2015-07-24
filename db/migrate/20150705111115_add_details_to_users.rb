class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :l_name, :string
    rename_column :users, :name, :f_name 
  end
end
