class CreateRolesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :roles_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.timestamps
    end
  end
end
