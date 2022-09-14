class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :departments, :departement, :department
    rename_column :teaching_requests, :departement_id, :department_id
  end
end
