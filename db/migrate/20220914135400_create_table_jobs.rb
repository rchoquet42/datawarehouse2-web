class CreateTableJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job

      t.timestamps
    end

    create_table :departement do |t|
      t.string :institution
      t.string :departement
      t.string :head
      t.string :head_email
      t.string :city

      t.timestamps
    end

    add_reference :teaching_requests, :departement
    end
end
