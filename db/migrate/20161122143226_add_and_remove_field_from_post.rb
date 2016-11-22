class AddAndRemoveFieldFromPost < ActiveRecord::Migration
  def change
    add_column :posts, :image_url, :string
    remove_column :posts, :filepicker_url, :string
  end
end
