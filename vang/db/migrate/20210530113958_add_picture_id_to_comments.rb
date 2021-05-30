class AddPictureIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :picture_id, :integer
  end
end
