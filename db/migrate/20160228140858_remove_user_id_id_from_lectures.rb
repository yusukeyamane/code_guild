class RemoveUserIdIdFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :user_id_id, :Integer
  end
end
