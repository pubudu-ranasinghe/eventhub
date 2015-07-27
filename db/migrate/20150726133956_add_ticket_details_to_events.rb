class AddTicketDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ticket_details, :text
  end
end
