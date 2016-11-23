class AddArchiveDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :archive_date, :date
  end
end
