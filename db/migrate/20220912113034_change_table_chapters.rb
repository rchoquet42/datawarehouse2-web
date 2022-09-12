class ChangeTableChapters < ActiveRecord::Migration[7.0]
  def change
    remove_column :chapters, :figpdf_path
    remove_column :chapters, :slides_path
    remove_column :chapters, :figEpdf_path
    remove_column :chapters, :answers_path
    remove_column :chapters, :samples_path

    add_column :chapters, :path, :string
    add_column :chapters, :type, :string
  end
end
