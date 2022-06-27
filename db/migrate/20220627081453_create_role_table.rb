class CreateRoleTable < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.text  :role_name

      t.timestamps

    end

    create_table :users_roles do |t|
      t.belongs_to :user
      t.belongs_to :role

      t.timestamps
    end
  end
end
