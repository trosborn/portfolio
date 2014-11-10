class RenameUrlToBody < ActiveRecord::Migration
  def change
    rename_column :images, :url, :body
  end
end
