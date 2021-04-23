class GiveDefaultForCommentsToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items , :comment , :text ,default: "No Comment"
  end
end
