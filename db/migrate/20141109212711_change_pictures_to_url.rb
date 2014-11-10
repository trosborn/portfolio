class ChangePicturesToUrl < ActiveRecord::Migration
  def change
    rename_column :images, :pictures, :url
  end
end
