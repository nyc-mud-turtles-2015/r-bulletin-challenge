class AddAttachmentClipToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.attachment :clip
    end
  end

  def self.down
    remove_attachment :messages, :clip
  end
end
