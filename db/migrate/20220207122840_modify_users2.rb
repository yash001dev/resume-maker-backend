class ModifyUsers2 < ActiveRecord::Migration[6.1]
  def change
    change_column("users", "first_name", :string, :null => false)
    change_column("users", "last_name", :string, :null => false)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
