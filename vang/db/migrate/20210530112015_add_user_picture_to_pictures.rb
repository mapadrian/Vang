class AddUserPictureToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :user_picture, :string
  end
end
