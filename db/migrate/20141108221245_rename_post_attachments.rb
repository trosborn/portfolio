class RenamePostAttachments < ActiveRecord::Migration
  def change
    rename_table :post_attachments, :images
  end
end
