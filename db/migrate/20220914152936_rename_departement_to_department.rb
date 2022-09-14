class RenameDepartementToDepartment < ActiveRecord::Migration[7.0]
  def change
    rename_table :departement, :departments
  end
end
