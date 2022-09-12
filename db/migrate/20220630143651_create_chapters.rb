class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|

      t.integer :number
      t.string :name

      t.string :slides_path
      t.string :figpdf_path
      t.string :figEpdf_path
      t.string :answers_path
      t.string :samples_path


      t.timestamps
    end
  end
end
