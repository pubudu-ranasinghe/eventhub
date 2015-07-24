class AddAttachmentCoverToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :events, :cover
  end
end
