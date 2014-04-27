class ChangeDescriptiontoBody < ActiveRecord::Migration
  def change
  	rename_column :posts, :description, :body
  end
end
