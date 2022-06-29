class CreateTeachingRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :teaching_requests do |t|
      t.belongs_to :user
      t.text :job
      t.text :why

      t.timestamps
    end
  end
end
