class DeleteTableChapter < ActiveRecord::Migration[7.0]
  def change
    drop_table :chapters

    create_table :reviews do |t|

      t.belongs_to :user
      t.string :review
      t.integer :note
      t.string :reviewer_details


      t.timestamps
    end
  end
end
